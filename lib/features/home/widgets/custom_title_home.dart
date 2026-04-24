import 'package:electronics_store/core/constant/my_color.dart';
import 'package:flutter/material.dart';

class CustomTitleHome extends StatelessWidget {
  final String title;
  const CustomTitleHome({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(color: MyColor.themeBlackColor, fontSize: 18),
      ),
    );
  }
}
