import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/features/auth/data/auth_data.dart';
import 'package:electronics_store/data/static/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  // Dependencies
  final AuthData authData = AuthData(Get.find());
  final MyService myService = Get.find();

  // Form Management
  GlobalKey<FormState> formstate = GlobalKey();

  // State Management
  StateRequest stateRequest = StateRequest.none;

  // Form Properties
  String? email;
  late TextEditingController password;
  late TextEditingController rePassword;
  bool isShowPassword = true;
  bool isShowRePassword = true;

  // Methods
  void resetPassword();
  void showPassword();
  void showRePassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  @override
  void onInit() {
    email = myService.sharedPreferences.getString("emailforget");
    password = TextEditingController();
    rePassword = TextEditingController();
    super.onInit();
  }

  @override
  Future<void> resetPassword() async {
    // 1. التحقق من صحة المدخلات (Validator)
    if (formstate.currentState?.validate() != true) return;

    // 2. التحقق من تطابق كلمتي المرور (UI Logic)
    if (password.text != rePassword.text) {
      Get.defaultDialog(
        title: MyText.alert.tr,
        middleText: MyText.passwordsNotMatchDialog.tr,
      );
      return;
    }

    if (email == null) {
      Get.snackbar(MyText.error, "حدث خطأ، يرجى إعادة طلب استعادة كلمة المرور");
      return;
    }

    stateRequest = StateRequest.loading;
    update();

    // 3. إرسال طلب التغيير للسيرفر
    var response = await authData.resetPassword(email!, password.text);

    // 4. معالجة الرد
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
        await myService.sharedPreferences.remove("emailforget");
        // الانتقال لصفحة نجاح تغيير كلمة المرور
        Get.offAllNamed(MyPages.successForgetPassword);
        update();
      },
    );
  }

  @override
  void showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  @override
  void showRePassword() {
    isShowRePassword = !isShowRePassword;
    update();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }
}
