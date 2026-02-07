import 'package:electronics_store/controller/forget_password/forgetpassword_controller.dart';
import 'package:electronics_store/core/class/handling_data_view.dart';
import 'package:electronics_store/core/constant/my_color.dart';
import 'package:electronics_store/core/function/valid_input.dart';
import 'package:electronics_store/data/datasource/static/my_text.dart';
import 'package:electronics_store/view/widget/auth/custom_button_auth.dart';
import 'package:electronics_store/view/widget/auth/custom_text_body_auth.dart';
import 'package:electronics_store/view/widget/auth/custom_text_form_auth.dart';
import 'package:electronics_store/view/widget/auth/custom_text_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends GetView<ForgetpasswordControllerImp> {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.bgColorOnBoarding,
      appBar: AppBar(
        backgroundColor: MyColor.bgColorOnBoarding,
        title: Text(
          MyText.forgetPassword.tr,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.normal),
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: GetBuilder<ForgetpasswordControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            state: controller.stateRequest,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Form(
                key: controller.formstate,
                child: ListView(
                  children: [
                    // title
                    CustomTextTitleAuth(
                      text: MyText.forgetPasswordTitle.tr,
                    ), // Check Email
                    const SizedBox(height: 10),

                    // body
                    CustomTextBodyAuth(
                      text: MyText.forgetPasswordDescription.tr,
                    ), // Please enter your email...
                    const SizedBox(height: 55),

                    // email
                    CustomTextFormAuth(
                      valid: (val) => validInput(val!, 5, 20, "email"),
                      hintText: MyText.enterEmail.tr, // Enter Your Email
                      labelText: MyText.email.tr, // Email
                      iconData: Icons.email_outlined,
                      myController: controller.email,
                    ),
                    const SizedBox(height: 10),

                    // Check button
                    CustomButtonAuth(
                      text: MyText.forgetPasswordCheck.tr, // Check
                      onPressed: () {
                        controller.checkEmail();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
