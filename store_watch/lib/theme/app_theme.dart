import 'package:flutter/material.dart';

final Map appThemeMap = {
  "light": ThemeData(
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: Color(0xfffcc873)),
    ),
  ),
  "dark": ThemeData(
    brightness: Brightness.dark,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: Color(0xfffcc873)),
    ),
  ),
};
