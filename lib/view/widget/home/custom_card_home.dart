import 'package:electronics_store/controller/home/home_page_controller.dart';
import 'package:electronics_store/core/constant/my_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardHome extends GetView<HomePageControllerImp> {
  final String title;
  final String subtitle;
  const CustomCardHome({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: MyColor.themeColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 20,
              ),
              title: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              subtitle: Text(
                subtitle,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
          Positioned(
            right: controller.lang == "en" ? -25 : null,
            left: controller.lang == "ar" ? -25 : null,
            top: -25,
            child: Container(
              height: 170,
              width: 170,
              decoration: BoxDecoration(
                color: MyColor.themeBlackColor,
                borderRadius: BorderRadius.circular(160),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
