import 'package:electronics_store/core/constant/my_image_asset.dart';
import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(MyImageAsset.logo, height: 150);
  }
}
