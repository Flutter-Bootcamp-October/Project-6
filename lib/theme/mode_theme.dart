import 'package:flutter/material.dart';

final Map appTheme = {
  "light": ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
        style:
            ElevatedButton.styleFrom(backgroundColor: const Color(0xfffcc873))),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: Color(0xff233b67),
      elevation: 0,
    ),
    useMaterial3: false,
    brightness: Brightness.light,
  ),
  "dark": ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
        style:
            ElevatedButton.styleFrom(backgroundColor: const Color(0xfffcc873))),
    useMaterial3: false,
    brightness: Brightness.dark,
  ),
};
