import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/function/handing_data_controller.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/data/datasource/remote/reset_password_data.dart';
import 'package:electronics_store/data/datasource/static/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  void resetPassword();
  void showPassword();
  void showRePassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey();

  String? email;

  late TextEditingController password;
  late TextEditingController rePassword;

  bool isShowPassword = true;
  bool isShowRePassword = true;

  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

  StateRequest stateRequest = StateRequest.none;

  MyService myService = Get.find();

  @override
  Future<void> resetPassword() async {
    if (formstate.currentState?.validate() != true) return;

    stateRequest = StateRequest.loading;
    update();

    // التحقق من تطابق كلمة المرور
    if (password.text != rePassword.text) {
      Get.defaultDialog(
        title: MyText.alert.tr,
        middleText: MyText.passwordsNotMatchDialog.tr,
      );
      stateRequest = StateRequest.none;
      return;
    }

    if (email == null) {
      stateRequest = StateRequest.serverfailure;
      update();
      return;
    }
    final response = await resetPasswordData.postResetPasswordDataAndGet(
      email!,
      password.text,
    );

    stateRequest = handlingData(response);

    if (stateRequest != StateRequest.success) {
      update();
      return;
    }

    // نجاح كامل
    if (response["status"] == "success") {
      myService.sharedPreferences.remove("emailforget");
      Get.offAllNamed(MyPages.successForgetPassword);
      update();
      return;
    }
    // أي خطأ آخر من السيرفر (errorKey)
    Get.defaultDialog(
      title: MyText.warning.tr,
      middleText: response["errorKey"].toString().tr,
    );
    update();
  }

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
  void onInit() {
    email = myService.sharedPreferences.getString("emailforget");
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
