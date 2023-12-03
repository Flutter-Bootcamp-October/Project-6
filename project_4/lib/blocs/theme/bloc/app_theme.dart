import 'package:flutter/material.dart';

final Map appThemeMap = {
  "light": ThemeData(
      useMaterial3: false,
      hintColor: Colors.black,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xfffccf78)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xfffccf78)))),
  "dark": ThemeData(
      useMaterial3: false,
      hintColor: Colors.black,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFBA7F0A)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFBA7F0A)))),
};
