import "package:electronics_store/core/constant/my_color.dart";
import "package:electronics_store/features/on_boarding/widgets/custom_dot_controller.dart";
import "package:electronics_store/features/on_boarding/widgets/custom_slider.dart";
import "package:flutter/material.dart";

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.bgColorOnBoarding,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(flex: 4, child: CustomSliderOnBoarding()),
              Expanded(child: CustomDotControllerOnBoarding()),
            ],
          ),
        ),
      ),
    );
  }
}
