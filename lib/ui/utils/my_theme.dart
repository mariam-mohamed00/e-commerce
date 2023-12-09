import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryColor = Color(0xff004182);
  static Color darkPrimaryColor = Color(0xff06004F);
  static Color whiteColor = Color(0xffFFFFFF);
  static Color hintText = Color(0xff000000);
  static Color lightGreyColor = Color(0xff004182);
  static Color blueGreyColor = Color(0xff06004F99);

  static ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 24, fontWeight: FontWeight.w600, color: whiteColor),
      titleMedium: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w500, color: whiteColor),
      titleSmall: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: darkPrimaryColor),
    ),
  );
}