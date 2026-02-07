import 'package:electronics_store/core/constant/my_color.dart';
import 'package:flutter/material.dart';

class CardAddressCheckout extends StatelessWidget {
  final String title;
  final String body;
  final bool active;
  final void Function() onCard;
  const CardAddressCheckout({
    super.key,
    required this.title,
    required this.body,
    required this.active,
    required this.onCard,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCard,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: active ? MyColor.themeBlackColor : null,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(
                color: active
                    ? MyColor.bgColorOnBoarding
                    : MyColor.themeBlackColor,
                fontWeight: active ? FontWeight.bold : null,
              ),
            ),
            subtitle: Text(
              body,
              style: TextStyle(
                color: active
                    ? MyColor.bgColorOnBoarding
                    : MyColor.themeBlackColor,
                fontWeight: active ? FontWeight.bold : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
