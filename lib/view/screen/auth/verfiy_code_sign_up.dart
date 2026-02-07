import 'package:electronics_store/controller/auth/verfiy_code_sign_up_controller.dart';
import 'package:electronics_store/core/class/handling_data_view.dart';
import 'package:electronics_store/data/datasource/static/my_text.dart';
import 'package:electronics_store/view/widget/auth/custom_text_body_auth.dart';
import 'package:electronics_store/view/widget/auth/custom_text_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerfiyCodeSignUp extends GetView<VerfiyCodeSignUpControllerImp> {
  const VerfiyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          MyText.verifyCodeTitle.tr,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.normal),
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: GetBuilder<VerfiyCodeSignUpControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            state: controller.stateRequest,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: ListView(
                children: [
                  CustomTextTitleAuth(text: MyText.verifyCodeSubtitle.tr),
                  const SizedBox(height: 10),
                  CustomTextBodyAuth(text: MyText.verifyCodeDescription.tr),
                  const SizedBox(height: 55),
                  OtpTextField(
                    numberOfFields: 5,
                    borderColor: const Color(0xFF512DA8),
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {},
                    onSubmit: (String verificationCode) {
                      controller.verfiyCodeSignUp(verificationCode);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
