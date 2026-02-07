import 'package:electronics_store/core/constant/my_color.dart';
import 'package:flutter/material.dart';

class TopCountItemCart extends StatelessWidget {
  final String message;
  const TopCountItemCart({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: MyColor.themeWhiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(color: MyColor.themeBlackColor),
      ),
    );
  }
}
