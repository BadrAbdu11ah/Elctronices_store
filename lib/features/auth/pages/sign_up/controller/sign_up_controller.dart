import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/data/static/my_text.dart';
import 'package:electronics_store/features/auth/data/auth_data.dart';
import 'package:electronics_store/features/auth/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  // Dependencies
  final MyService myService = Get.find();
  final AuthService authService = Get.find<AuthService>();
  final AuthData authData = AuthData(Get.find());

  // Form Management
  GlobalKey<FormState> formstate = GlobalKey();

  // State Management
  StateRequest stateRequest = StateRequest.none;

  // Form Properties
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  bool isShowPassword = true;

  // Data Lists
  List data = [];

  // Methods
  void signUp();
  void goToSignIn();
  void showPassword();
}

class SignUpControllerImp extends SignUpController {
  // الاعتماد على AuthService و AuthData

  @override
  Future<void> signUp() async {
    if (formstate.currentState?.validate() != true) return;

    stateRequest = StateRequest.loading;
    update();

    // 1. إرسال الطلب للسيرفر
    var response = await authData.signup(
      username: username.text,
      email: email.text,
      password: password.text,
      phone: phone.text,
    );

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
        await myService.sharedPreferences.setString("emailsignup", email.text);
        // الانتقال لصفحة كود التحقق
        Get.offNamed(MyPages.verfiyCodeSginUp);

        update();
      },
    );
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
  void showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  @override
  void goToSignIn() {
    Get.offAllNamed(MyPages.login);
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
