import 'package:electronics_store/controller/on_boarding_controller.dart';
import 'package:electronics_store/core/constant/my_color.dart';
import 'package:electronics_store/data/datasource/static/my_text.dart';
import 'package:electronics_store/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDotControllerOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // SKIP
        InkWell(
          onTap: () {
            controller.skip();
          },
          child: SizedBox(
            height: 40,
            child: Text(
              MyText.skip.tr,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        // Pagination Dots
        GetBuilder<OnBoardingControllerImp>(
          builder: (controller) {
            return Row(
              children: [
                ...List.generate(onBoardingList.length, (index) {
                  return AnimatedContainer(
                    margin: const EdgeInsets.only(right: 5),
                    duration: const Duration(milliseconds: 900),
                    height: 6,
                    width: controller.currentPage == index ? 15 : 6,
                    decoration: BoxDecoration(
                      color: MyColor.themeColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                }),
              ],
            );
          },
        ),
        // NEXT & FINISH
        InkWell(
          onTap: () {
            controller.next();
          },
          child: GetBuilder<OnBoardingControllerImp>(
            builder: (controller) {
              return SizedBox(
                height: 40,
                child: Text(
                  controller.currentPage != onBoardingList.length - 1
                      ? MyText.next.tr
                      : MyText.finish.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
