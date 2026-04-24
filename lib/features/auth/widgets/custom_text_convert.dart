import 'package:electronics_store/core/constant/my_color.dart';
import 'package:flutter/material.dart';

class CustomTextConvert extends StatelessWidget {
  final String textone;
  final String texttow;
  final void Function() onTap;
  const CustomTextConvert({
    super.key,
    required this.textone,
    required this.texttow,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textone, style: TextStyle(fontSize: 14)),
        InkWell(
          onTap: onTap,
          child: Text(
            texttow,
            style: TextStyle(
              color: MyColor.themeColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
