import 'package:flutter/material.dart';

Map<String, ThemeData> appTheme = {
  'light': ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xfffefeff),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xfffefeff),
    ),
  ),
  'dark': ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xfffbcf7a),
    ),
  ),
};
