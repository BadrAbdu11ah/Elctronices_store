import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/data/static/my_text/on_boarding_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  // Dependencies
  MyService myService = Get.find();

  // Navigation Management
  // المتحكم المسؤول عن التنقل بين صفحات الـ PageView
  late PageController pageController;

  // State Properties
  // رقم الصفحة الحالية (يبدأ من 0)
  int currentPage = 0;

  // Methods
  void next();
  void skip();
  void getOnPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  @override
  void onInit() {
    pageController = PageController(); // تهيئة متحكم الصفحات
    super.onInit();
  }

  @override
  // تُستدعى عند تغيير الصفحة بالسحب اليدوي
  getOnPageChanged(int index) {
    currentPage = index; // تحديث رقم الصفحة الحالية
    update(); // تحديث الواجهة (مثل المؤشرات أسفل الشاشة)
  }

  @override
  // تُستدعى عند الضغط على زر "التالي"
  next() {
    currentPage++; // الانتقال إلى الصفحة التالية

    // إذا وصل المستخدم لآخر صفحة → الانتقال لصفحة تسجيل الدخول
    if (currentPage > onBoardingList.length - 1) {
      myService.sharedPreferences.setString("step", "1");
      Get.offAllNamed(MyPages.login);
      return;
    }

    // تحريك الصفحة الجديدة بشكل سلس
    pageController.animateToPage(
      currentPage,
      duration: Duration(milliseconds: 900), // مدة الحركة
      curve: Curves.easeInOut, // حركة سلسة
    );
  }

  @override
  // زر "تخطي" → الانتقال مباشرة لصفحة تسجيل الدخول
  void skip() {
    myService.sharedPreferences.setString("step", "1");
    Get.offAllNamed(MyPages.login);
  }
}
