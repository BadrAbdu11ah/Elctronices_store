import 'package:electronics_store/core/constant/my_color.dart';
import 'package:flutter/material.dart';

class BottomCheckout extends StatelessWidget {
  final String textButton;
  final void Function() onCheckout;
  const BottomCheckout({
    super.key,
    required this.textButton,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 100),
        color: MyColor.themeBlackColor,
        textColor: MyColor.bgColorOnBoarding,
        onPressed: onCheckout,
        child: Text(textButton, style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
