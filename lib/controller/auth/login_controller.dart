import 'package:electronics_store/controller/auth/login_helpers.dart';
import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/function/handing_data_controller.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/data/datasource/remote/login_data.dart';
import 'package:electronics_store/data/datasource/static/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  void login();
  void showPassword();
  void goToForgetpassword();
  void goToSignUp();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;

  GlobalKey<FormState> formstate = GlobalKey();

  bool isShowPassword = true;

  MyService myService = Get.find();

  LoginData loginData = LoginData(Get.find());

  StateRequest stateRequest = StateRequest.none;

  @override
  Future<void> login() async {
    if (formstate.currentState?.validate() != true) return;

    stateRequest = StateRequest.loading;
    update();

    final response = await loginData.postLoginDataAndGet(
      email.text,
      password.text,
    );
    stateRequest = handlingData(response);

    if (stateRequest != StateRequest.success) {
      update();
      return;
    }

    if (response['errorKey'] == "accountNotActive") {
      handleAccountNotActive(
        onpressed: () {
          resendVerifyCode(
            loginData: loginData,
            myService: myService,
            email: email.text,
          );
        },
      );
      update();
      return;
    }

    if (response["status"] == "failure") {
      Get.defaultDialog(
        title: MyText.warning.tr,
        middleText: response["errorKey"].toString().tr,
      );
      update();
      return;
    }

    // نجاح كامل
    handleSuccessLogin(response, myService);
    update();
  }

  @override
  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  @override
  goToForgetpassword() {
    Get.toNamed(MyPages.forgetPassword);
  }

  @override
  goToSignUp() {
    Get.toNamed(MyPages.signUp);
  }

  @override
  void onInit() async {
    email = TextEditingController();
    password = TextEditingController();
    await initFirebaseStuff();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
