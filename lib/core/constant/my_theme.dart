import 'package:electronics_store/core/constant/my_color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: "PlayfairDisplay",
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: MyColor.titleColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 17,
      height: 1.5, // مقدار المسافة بين الأسطر
      color: MyColor.bodyColor,
    ),
  ),
);
ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: MyColor.titleColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      height: 1.5, // مقدار المسافة بين الأسطر
      color: MyColor.bodyColor,
    ),
  ),
);
