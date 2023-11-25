import 'package:flutter/material.dart';

final Map appThemeMap = {
  "light": ThemeData(
      useMaterial3: false,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xfffccf78)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xfffccf78)))),
  "dark": ThemeData(
      useMaterial3: false,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFBA7F0A)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFBA7F0A)))),
};
