import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/function/handing_data_controller.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/data/datasource/remote/forget_password_data.dart';
import 'package:electronics_store/data/datasource/static/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetpasswordController extends GetxController {
  void checkEmail();
}

class ForgetpasswordControllerImp extends ForgetpasswordController {
  late TextEditingController email;

  GlobalKey<FormState> formstate = GlobalKey();

  StateRequest stateRequest = StateRequest.none;

  ForgetPasswordData forgetPasswordData = ForgetPasswordData(Get.find());

  MyService myService = Get.find();

  @override
  Future<void> checkEmail() async {
    if (formstate.currentState?.validate() != true) return;

    stateRequest = StateRequest.loading;
    update();

    final response = await forgetPasswordData.postForgetPasswordDataAndGet(
      email.text,
    );

    stateRequest = handlingData(response);

    if (stateRequest != StateRequest.success) {
      update();
      return;
    }

    if (response["status"] != "success") {
      Get.defaultDialog(
        title: MyText.warning.tr,
        middleText: response["errorKey"].toString().tr,
      );
      update();
      return;
    }

    // نجاح كامل
    await myService.sharedPreferences.setString("emailforget", email.text);
    Get.offNamed(MyPages.verfiyCodePassword);
    update();
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
