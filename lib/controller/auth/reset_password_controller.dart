import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  void resetPassword();
  void showPassword();
  void showRePassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey();

  late TextEditingController password;
  late TextEditingController rePassword;

  bool isShowPassword = true;
  bool isShowRePassword = true;

  @override
  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  @override
  showRePassword() {
    isShowRePassword = !isShowRePassword;
    update();
  }

  @override
  resetPassword() {
    if (formstate.currentState!.validate()) {
      Get.offAllNamed(MyPages.successForgetPassword);
    } else {
      print("not valid");
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();

    super.dispose();
  }
}
