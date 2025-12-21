import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  void next();
  void skip();
  void getOnPageChanged(int index);
}

// تعريف الكلاس الذي يقوم بتنفيذ (Implementation) منطق شاشات الترحيب
class OnBoardingControllerImp extends OnBoardingController {
  // متحكم Flutter Widget المسؤول عن التنقل بين الصفحات (PageView)
  late PageController pageController;
  // متغير لحفظ فهرس (Index) الصفحة المعروضة حالياً (يبدأ من 0)
  int currentPage = 0;

  MyService myService = Get.find();

  // ------------------------------------------------------------------

  @override
  // دالة تُستدعى عندما يقوم المستخدم بالسحب والتنقل يدوياً إلى صفحة جديدة
  getOnPageChanged(int index) {
    // تحديث رقم الصفحة الحالية بالفهرس الجديد
    currentPage = index;
    // إعلام الواجهة (Widgets) بأن البيانات قد تغيرت لإعادة البناء (لتحديث المؤشرات مثلاً)
    update();
  }

  // ------------------------------------------------------------------

  @override
  // دالة تُستدعى عند الضغط على زر "التالي" (Next Button)
  next() {
    // زيادة رقم الصفحة الحالية بمقدار 1 للانتقال إلى الصفحة التالية
    currentPage++;

    if (currentPage > onBoardingList.length - 1) {
      myService.sharedPreferences.setString("onboarding", "1");
      Get.offAllNamed(MyPages.login);
    }
    // تحريك سلس (Animated) لمتحكم الصفحة للانتقال إلى رقم الصفحة الجديدة
    pageController.animateToPage(
      currentPage, // الانتقال إلى الصفحة الجديدة (الحالية + 1)
      duration: Duration(
        milliseconds: 900,
      ), // زمن التحريك: 900 مللي ثانية (0.9 ثانية)
      curve: Curves.easeInOut, // نمط الحركة: بدء بطيء ونهاية بطيئة
    );
  }

  // ------------------------------------------------------------------

  @override
  // دالة تُستدعى عند إنشاء المتحكم لأول مرة (Initialization)
  void onInit() {
    // تهيئة متحكم الصفحة (PageController) ليكون جاهزاً للاستخدام
    pageController = PageController();
    // استدعاء دالة التهيئة الأساسية للفصل الأب
    super.onInit();
  }

  @override
  void skip() {
    myService.sharedPreferences.setString("onboarding", "1");
    Get.offAllNamed(MyPages.login);
  }
}
