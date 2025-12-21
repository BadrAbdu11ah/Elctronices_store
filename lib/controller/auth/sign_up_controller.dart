import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  void signUp();
  void goToSignIn();
  void showPassword();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;

  GlobalKey<FormState> formstate = GlobalKey();

  bool isShowPassword = true;

  @override
  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  @override
  signUp() {
    if (formstate.currentState?.validate() == true) {
      Get.toNamed(MyPages.verfiyCodeSginUp);
    } else {
      print("not valid");
    }
  }

  @override
  goToSignIn() {
    Get.offAllNamed(MyPages.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    phone.dispose();
    super.dispose();
  }
}
