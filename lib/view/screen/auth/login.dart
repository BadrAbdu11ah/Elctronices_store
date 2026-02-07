import 'package:electronics_store/controller/auth/login_controller.dart';
import 'package:electronics_store/core/class/handling_data_view.dart';
import 'package:electronics_store/core/constant/my_color.dart';
import 'package:electronics_store/core/function/alert_exit_app.dart';
import 'package:electronics_store/core/function/valid_input.dart';
import 'package:electronics_store/data/datasource/static/my_text.dart';
import 'package:electronics_store/view/widget/auth/custom_button_auth.dart';
import 'package:electronics_store/view/widget/auth/custom_logo.dart';
import 'package:electronics_store/view/widget/auth/custom_text_body_auth.dart';
import 'package:electronics_store/view/widget/auth/custom_text_convert.dart';
import 'package:electronics_store/view/widget/auth/custom_text_form_auth.dart';
import 'package:electronics_store/view/widget/auth/custom_text_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends GetView<LoginControllerImp> {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.bgColorOnBoarding,
      appBar: AppBar(
        backgroundColor: MyColor.bgColorOnBoarding,
        title: Text(
          MyText.signIn.tr,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.normal),
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          // إذا خرج لا يفعل شيء
          if (didPop) return;
          // إظهار تنبيه للمستخدم قبل الخروج
          alertExitApp();
        },
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) {
            return HandlingDataView(
              state: controller.stateRequest,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      const CustomLogo(),
                      const SizedBox(height: 10),
                      CustomTextTitleAuth(text: MyText.welcomeBack.tr),
                      const SizedBox(height: 10),
                      CustomTextBodyAuth(text: MyText.loginDescription.tr),
                      const SizedBox(height: 50),
                      CustomTextFormAuth(
                        valid: (val) => validInput(val!, 5, 20, "email"),
                        hintText: MyText.enterEmail.tr,
                        labelText: MyText.email.tr,
                        iconData: Icons.email_outlined,
                        myController: controller.email,
                      ),
                      const SizedBox(height: 20),
                      GetBuilder<LoginControllerImp>(
                        builder: (controller) {
                          return CustomTextFormAuth(
                            obscureText: controller.isShowPassword,
                            onTapIcon: () {
                              controller.showPassword();
                            },
                            valid: (val) => validInput(val!, 3, 10, "password"),
                            hintText: MyText.enterPassword.tr,
                            labelText: MyText.password.tr,
                            iconData: controller.isShowPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            myController: controller.password,
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: InkWell(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            controller.goToForgetpassword();
                          },
                          child: Text(
                            MyText.forgetPassword.tr,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      CustomButtonAuth(
                        text: MyText.signIn.tr,
                        onPressed: () async {
                          if (controller.formstate.currentState?.validate() ==
                              true) {
                            FocusScope.of(context).unfocus();
                            await controller.login();
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                      CustomTextConvert(
                        textone: MyText.dontHaveAccount.tr,
                        texttow: MyText.goSignUp.tr,
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          controller.goToSignUp();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
