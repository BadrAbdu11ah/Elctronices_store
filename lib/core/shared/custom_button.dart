import 'package:electronics_store/core/constant/my_color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.symmetric(vertical: 10),
        color: MyColor.themeColor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(text, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
