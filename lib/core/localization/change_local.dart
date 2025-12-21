import 'package:electronics_store/core/constant/my_theme.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  // الوصول إلى الخدمات (SharedPreferences)
  MyService myService = Get.find();

  // تغيير اللغة والثيم
  void changeLang(String langCode) {
    // إنشاء كائن اللغة من الكود
    final locale = Locale(langCode);

    // حفظ كود اللغة في ذاكرة الجهاز
    myService.sharedPreferences.setString("lang", langCode);

    // تحديث لغة التطبيق
    Get.updateLocale(locale);

    // تغيير الثيم حسب اللغة
    Get.changeTheme(langCode == "ar" ? themeArabic : themeEnglish);
  }

  @override
  void onInit() {
    // جلب اللغة المحفوظة من ذاكرة الجهاز
    final String? sharedPrefLang = myService.sharedPreferences.getString(
      "lang",
    );

    // إذا كانت اللغة عربية
    if (sharedPrefLang == "ar") {
      // تعيين اللغة العربية
      Get.updateLocale(const Locale("ar"));
      // تعيين الثيم العربي
      Get.changeTheme(themeArabic);

      // إذا كانت اللغة إنجليزية
    } else if (sharedPrefLang == "en") {
      // تعيين اللغة الإنجليزية
      Get.updateLocale(const Locale("en"));
      // تعيين الثيم الإنجليزي
      Get.changeTheme(themeEnglish);

      // إذا لم تكن هناك لغة محفوظة
    } else {
      // أخذ لغة الجهاز
      final deviceLang = Get.deviceLocale?.languageCode ?? "en";

      // تعيين لغة الجهاز
      Get.updateLocale(Locale(deviceLang));

      // تعيين الثيم حسب لغة الجهاز
      Get.changeTheme(deviceLang == "ar" ? themeArabic : themeEnglish);
    }

    // استدعاء onInit الأساسي
    super.onInit();
  }
}
