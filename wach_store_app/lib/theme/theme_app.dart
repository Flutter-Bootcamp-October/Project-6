import 'package:flutter/material.dart';

final Map appThemMap = {
  'light': ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      titleTextStyle: TextStyle(
        fontFamily: 'Crimson',
        fontSize: 20,
        color: Colors.black,
      ),
      backgroundColor: Color(0xfffefeff),
    ),
    useMaterial3: false,
  ),
  'dark': ThemeData(
    brightness: Brightness.dark,
    focusColor: Colors.white,
    useMaterial3: false,
  )
};
