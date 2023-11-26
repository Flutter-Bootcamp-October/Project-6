// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';

final Map appThemeMap = {
  "light": ThemeData(
    backgroundColor: appColorWhite,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: appColorBlue),
        backgroundColor: appColorWhite),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[300]),
    ),
  ),
  "dark": ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.purple[900],
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple[700],
      ),
    ),
  ),
};
