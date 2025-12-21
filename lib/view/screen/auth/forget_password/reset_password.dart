import 'package:electronics_store/controller/auth/reset_password_controller.dart';
import 'package:electronics_store/core/constant/my_color.dart';
import 'package:electronics_store/core/function/valid_input.dart';
import 'package:electronics_store/data/datasource/static/my_text.dart';
import 'package:electronics_store/view/widget/auth/custom_button_auth.dart';
import 'package:electronics_store/view/widget/auth/custom_text_body_auth.dart';
import 'package:electronics_store/view/widget/auth/custom_text_form_auth.dart';
import 'package:electronics_store/view/widget/auth/custom_text_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends GetView<ResetPasswordControllerImp> {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.bgColorOnBoarding,
      appBar: AppBar(
        backgroundColor: MyColor.bgColorOnBoarding,
        title: Text(
          MyText.resetPasswordTitle.tr, // Reset Password
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.normal),
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Form(
          key: controller.formstate,
          child: ListView(
            children: [
              // title
              CustomTextTitleAuth(text: MyText.newPassword.tr), // New Password
              SizedBox(height: 10),
              // body
              CustomTextBodyAuth(
                text: MyText.resetPasswordDescription.tr,
              ), // Please enter your new password
              SizedBox(height: 55),
              // password
              GetBuilder<ResetPasswordControllerImp>(
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
              // re-enter password
              GetBuilder<ResetPasswordControllerImp>(
                builder: (controller) {
                  return CustomTextFormAuth(
                    obscureText: controller.isShowRePassword,
                    onTapIcon: () {
                      controller.showRePassword();
                    },
                    valid: (val) => validInput(val!, 3, 10, "password"),
                    hintText: MyText.enterPassword.tr,
                    labelText: MyText.password.tr,
                    iconData: controller.isShowRePassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    myController: controller.rePassword,
                  );
                },
              ),
              // button save
              CustomButtonAuth(
                text: MyText.save.tr, // Save
                onPressed: () {
                  controller.resetPassword();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
