import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/features/auth/data/auth_data.dart';
import 'package:electronics_store/data/static/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetpasswordController extends GetxController {
  // Dependencies
  final AuthData authData = AuthData(Get.find());
  final MyService myService = Get.find();

  // Form Management
  GlobalKey<FormState> formstate = GlobalKey();

  // State Management
  StateRequest stateRequest = StateRequest.none;

  // Form Properties
  late TextEditingController email;

  // Methods
  void checkEmail();
}

class ForgetpasswordControllerImp extends ForgetpasswordController {
  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  Future<void> checkEmail() async {
    if (formstate.currentState?.validate() != true) return;

    stateRequest = StateRequest.loading;
    update();

    // 1. طلب التحقق من الإيميل من السيرفر
    var response = await authData.checkEmail(email.text);

    // 2. معالجة الرد
    response.fold(
      (failure) {
        stateRequest = failure;
        update();
      },
      (data) async {
        if (data["status"] == "failure") {
          stateRequest = StateRequest.none;
          Get.defaultDialog(
            title: MyText.warning.tr,
            middleText: data["errorKey"].toString().tr,
          );
          update();
          return;
        }

        stateRequest = StateRequest.success;
        await myService.sharedPreferences.setString("emailforget", email.text);
        Get.offNamed(MyPages.verfiyCodePassword);
        update();
      },
    );
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
