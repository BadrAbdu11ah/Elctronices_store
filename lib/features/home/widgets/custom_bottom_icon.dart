import 'package:electronics_store/core/constant/my_color.dart';
import 'package:flutter/material.dart';

class CustomBottomIcon extends StatelessWidget {
  final void Function() onIcon;
  final IconData icon;
  final String textIcon;
  final bool active;
  const CustomBottomIcon({
    super.key,
    required this.onIcon,
    required this.icon,
    required this.textIcon,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onIcon,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: active ? MyColor.themeBlackColor : MyColor.bodyColor,
            size: active ? 25 : 20,
          ),
          Text(
            textIcon,
            style: TextStyle(
              color: active ? MyColor.themeBlackColor : MyColor.bodyColor,
              fontSize: active ? 14 : 12,
            ),
          ),
        ],
      ),
    );
  }
}
