import 'package:electronics_store/features/auth/data/auth_data.dart';
import 'package:electronics_store/features/auth/pages/login/login_helpers.dart';
import 'package:electronics_store/core/class/state_request.dart';
import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/services/my_service.dart';
import 'package:electronics_store/data/static/my_text.dart';
import 'package:electronics_store/features/auth/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  // Dependencies
  final AuthService authService = Get.find<AuthService>();
  final AuthData authData = AuthData(Get.find());
  MyService myService = Get.find();

  // Form Management
  GlobalKey<FormState> formstate = GlobalKey();

  // State Management
  StateRequest stateRequest = StateRequest.none;

  // Form Properties
  late TextEditingController email;
  late TextEditingController password;
  bool isShowPassword = true;

  // Methods
  void login();
  void showPassword();
  void goToForgetpassword();
  void goToSignUp();
}

class LoginControllerImp extends LoginController {
  @override
  void onInit() async {
    email = TextEditingController();
    password = TextEditingController();
    await initFirebaseStuff();
    super.onInit();
  }

  @override
  Future<void> login() async {
    if (formstate.currentState?.validate() != true) return;

    stateRequest = StateRequest.loading;
    update();

    // 1. طلب البيانات من السيرفر
    var response = await authData.login(email.text, password.text);

    response.fold(
      (failure) {
        stateRequest = failure;
        update();
      },
      (data) async {
        // 1. فحص الحالات الاستثنائية
        if (data['errorKey'] == "accountNotActive") {
          handleAccountNotActive(onpressed: () => resendCode());
          stateRequest = StateRequest.none;
          update();
          return; // الخروج المبكر
        }

        if (data["status"] == "failure") {
          stateRequest = StateRequest.none;
          Get.defaultDialog(
            title: MyText.warning.tr,
            middleText: data["errorKey"].toString().tr,
          );
          update();
          return; // الخروج المبكر
        }

        // 2. حالة النجاح
        stateRequest = StateRequest.success;
        await handleSuccessLogin(Map<String, dynamic>.from(data));
        update();
      },
    );
  }

  Future<void> resendCode() async {
    Get.back(); // إغلاق الديالوج
    stateRequest = StateRequest.loading;
    update();

    var response = await authData.resetVerifyCode(email.text);
    response.fold((failure) => Get.snackbar(MyText.error, "فشل الاتصال"), (
      data,
    ) {
      if (data['status'] == "success") {
        Get.toNamed(MyPages.verfiyCodeSginUp, arguments: {"email": email.text});
      }
    });
    stateRequest = StateRequest.none;
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
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
