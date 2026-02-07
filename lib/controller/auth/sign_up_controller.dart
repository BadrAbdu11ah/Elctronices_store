import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/function/handing_data_controller.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/data/datasource/remote/signup_data.dart';
import 'package:electronics_store/data/datasource/static/my_text.dart';
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

  MyService myService = Get.find();

  // ربط طبقة البيانات كونترولر
  SignupData signupData = SignupData(Get.find());

  // قائمة بيانات
  List data = [];

  // متغير لمراقبة حالة الطلب (تحميل، نجاح، خطأ)
  StateRequest stateRequest = StateRequest.none;

  @override
  Future<void> signUp() async {
    if (formstate.currentState?.validate() != true) return;

    stateRequest = StateRequest.loading;
    update();

    final response = await signupData.postSignupDataAndGet(
      username.text,
      email.text,
      password.text,
      phone.text,
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
    myService.sharedPreferences.setString("emailsignup", email.text);
    Get.offNamed(MyPages.verfiyCodeSginUp);
    update();
  }

  @override
  showPassword() {
    isShowPassword = !isShowPassword;
    update();
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
