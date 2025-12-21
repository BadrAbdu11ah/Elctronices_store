import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CheekEmailController extends GetxController {
  void cheekEmail();
  void goToVerfiyCodeSignUp();
}

class CheekEmailControllerImp extends CheekEmailController {
  late TextEditingController email;
  GlobalKey<FormState> formstate = GlobalKey();

  @override
  cheekEmail() {
    if (formstate.currentState!.validate()) {
      goToVerfiyCodeSignUp();
    } else {
      print("not valid");
    }
  }

  @override
  goToVerfiyCodeSignUp() {
    Get.offNamed(MyPages.verfiyCodeSginUp);
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
