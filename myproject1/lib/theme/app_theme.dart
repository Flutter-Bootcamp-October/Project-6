import 'package:flutter/material.dart';

final Map appThemeMap = {
  "light": ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(backgroundColor: Colors.grey[200]),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[200])),
  ),
  "dark": ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(backgroundColor: Colors.black),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black)),
  ),
};
