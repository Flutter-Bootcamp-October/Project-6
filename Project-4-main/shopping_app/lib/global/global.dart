import 'package:flutter/material.dart';
import 'package:shopping_app/consts/colors.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/models/user_model.dart';

List<User> usersList = [];
List<Product> productList = [];
User currentUser = User(
  email: 'sara@gmail.com',
  fullName: 'Sara A.',
  imagePath: 'assets/images/profile.png',
  mobileNumber: '0555555555',
  password: '1234',
);
final Map<String, ThemeData> appThemeMap = {
  "light": ThemeData(
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: appYellow, selectedItemColor: appBlue),
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: appYellow))),
  "dark": ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(backgroundColor: Colors.purple[900]),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.purple[900],
          selectedItemColor: Colors.purple[700]),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[700])))
};
