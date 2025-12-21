import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetpasswordController extends GetxController {
  void forgetpassword();
}

class ForgetpasswordControllerImp extends ForgetpasswordController {
  late TextEditingController email;

  GlobalKey<FormState> formstate = GlobalKey();

  @override
  forgetpassword() {
    if (formstate.currentState!.validate()) {
      Get.offNamed(MyPages.verfiyCodePassword);
    } else {
      print("not valid");
    }
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}
