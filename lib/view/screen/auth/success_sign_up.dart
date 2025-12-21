import 'package:electronics_store/controller/auth/success_sign_up_controller.dart';
import 'package:electronics_store/core/constant/my_color.dart';
import 'package:electronics_store/core/function/alert_exit_app.dart';
import 'package:electronics_store/data/datasource/static/my_text.dart';
import 'package:electronics_store/view/widget/auth/custom_button_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUp extends GetView<SuccessSignUpControllerImp> {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          MyText.successTitle.tr,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            fontWeight: FontWeight.normal,
            color: MyColor.themeColor,
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
      ),

      // LayoutBuilder: يعطيك أبعاد الشاشة لتصميم متجاوب
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;

          alertExitApp();
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              // ConstrainedBox: يفرض حد أدنى للارتفاع = ارتفاع الشاشة
              // حتى لا يلتصق المحتوى بالأعلى عند وجود سكرول
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                // IntrinsicHeight: يجعل الـ العمود يتمدد ليملأ المساحة المتاحة
                // ويسمح للـ سباسر بالعمل بشكل صحيح داخل سكرول فيو
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: 200,
                          color: MyColor.themeColor,
                        ),
                        Text(
                          MyText.successMessage.tr,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          MyText.successDescription.tr,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),

                        const Spacer(),

                        SizedBox(
                          width: double.infinity,
                          child: CustomButtonAuth(
                            text: MyText.goToLogin.tr,
                            onPressed: () {
                              controller.goToLogin();
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
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
