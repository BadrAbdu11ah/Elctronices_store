import 'package:electronics_store/controller/on_boarding_controller.dart';
import 'package:electronics_store/data/datasource/static/my_text/on_boarding_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      // physics: NeverScrollableScrollPhysics(), // يمنع السكرول
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.getOnPageChanged(value);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            // Image
            Image.asset(onBoardingList[index].image!),
            // title
            Text(
              onBoardingList[index].title!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 10),
            // body
            Text(
              onBoardingList[index].body!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        );
      },
    );
  }
}
