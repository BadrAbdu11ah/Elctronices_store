import 'package:electronics_store/core/constant/my_color.dart';
import 'package:flutter/material.dart';

class CardPymentMethod extends StatelessWidget {
  final String title;
  final bool active;
  final void Function() onCard;
  const CardPymentMethod({
    super.key,
    required this.title,
    required this.active,
    required this.onCard,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCard,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        decoration: BoxDecoration(
          color: active ? MyColor.themeBlackColor : null,

          border: Border.all(color: MyColor.themeBlackColor!, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: active ? MyColor.bgColorOnBoarding : MyColor.themeBlackColor,
            fontWeight: active ? FontWeight.bold : null,
          ),
        ),
      ),
    );
  }
}
