import 'package:electronics_store/core/constant/my_color.dart';
import 'package:flutter/material.dart';

class BottonCart extends StatelessWidget {
  final String title;
  final void Function() onButton;
  const BottonCart({super.key, required this.title, required this.onButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: MaterialButton(
        onPressed: onButton,
        color: MyColor.themeBlackColor,
        child: Text(title, style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
}
