import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  void login();
  void goToSignUp();
  void goToForgetpassword();
  void showPassword();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;

  GlobalKey<FormState> formstate = GlobalKey();

  bool isShowPassword = true;

  @override
  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  @override
  login() {
    if (formstate.currentState?.validate() == true) {
      print("valid");
    } else {
      print("not valid");
    }
  }

  @override
  goToSignUp() {
    Get.toNamed(MyPages.signUp);
  }

  @override
  goToForgetpassword() {
    Get.toNamed(MyPages.forgetPassword);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
