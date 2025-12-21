import 'package:electronics_store/core/constant/my_pages.dart';
import 'package:electronics_store/core/localization/change_local.dart';
import 'package:electronics_store/data/datasource/static/my_text.dart';
import 'package:electronics_store/view/widget/choose_language/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseLanguage extends GetView<LocaleController> {
  const ChooseLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ---------- Choose Language ----------
            Text(
              MyText.titleChooseLanguage.tr,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 10),

            // Arabic
            CustomButton(
              lang: MyText.arabic.tr,
              onPressed: () {
                controller.changeLang("ar");
                Get.offNamed(MyPages.onBoarding);
              },
            ),

            // English
            CustomButton(
              lang: MyText.english.tr,
              onPressed: () {
                controller.changeLang("en");
                Get.offNamed(MyPages.onBoarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
