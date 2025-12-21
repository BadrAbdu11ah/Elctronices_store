import 'package:electronics_store/controller/auth/sign_up_controller.dart';
import 'package:electronics_store/core/constant/my_color.dart';
import 'package:electronics_store/core/function/valid_input.dart';
import 'package:electronics_store/data/datasource/static/my_text.dart';
import 'package:electronics_store/view/widget/auth/custom_button_auth.dart';
import 'package:electronics_store/view/widget/auth/custom_text_convert.dart';
import 'package:electronics_store/view/widget/auth/custom_text_form_auth.dart';
import 'package:electronics_store/view/widget/auth/custom_text_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends GetView<SignUpControllerImp> {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.bgColorOnBoarding,
      appBar: AppBar(
        backgroundColor: MyColor.bgColorOnBoarding,
        title: Text(
          MyText.createAccount.tr,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.normal),
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Form(
          key: controller.formstate,
          child: ListView(
            children: [
              CustomTextTitleAuth(text: MyText.signUpDescription.tr),
              const SizedBox(height: 55),
              CustomTextFormAuth(
                valid: (val) => validInput(val!, 5, 20, "username"),
                hintText: MyText.enterUsername.tr,
                labelText: MyText.username.tr,
                iconData: Icons.person_outline,
                myController: controller.username,
              ),
              CustomTextFormAuth(
                valid: (val) => validInput(val!, 5, 20, "email"),
                hintText: MyText.enterEmail.tr,
                labelText: MyText.email.tr,
                iconData: Icons.email_outlined,
                myController: controller.email,
              ),
              GetBuilder<SignUpControllerImp>(
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
              CustomTextFormAuth(
                valid: (val) => validInput(val!, 2, 10, "phone"),
                hintText: MyText.enterPhone.tr,
                labelText: MyText.phone.tr,
                iconData: Icons.phone_android_outlined,
                myController: controller.phone,
                isNumber: true,
              ),
              const SizedBox(height: 10),
              CustomButtonAuth(
                text: MyText.signUp.tr,
                onPressed: () {
                  if (controller.formstate.currentState?.validate() == true) {
                    controller.signUp();
                  }
                },
              ),
              const SizedBox(height: 30),
              CustomTextConvert(
                textone: MyText.alreadyHaveAccount.tr,
                texttow: MyText.goSignIn.tr,
                onTap: () {
                  FocusScope.of(context).unfocus();
                  controller.goToSignIn();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
