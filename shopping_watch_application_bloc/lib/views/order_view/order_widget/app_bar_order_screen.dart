// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';
import 'package:shopping_watch_application_bloc/views/nav_bar_screen.dart';

PreferredSizeWidget AppBarOrderScreen(BuildContext context) {
  return AppBar(
    centerTitle: true,
    title: const Text(
      "My Orders",
      style: TextStyle(color: appColorBlue, fontWeight: FontWeight.w400),
    ),
    backgroundColor: appColorWhite,
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return NavBar();
        }));
      },
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: appColorBlue,
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return NavBar();
            }));
          },
          child: const Text(
            "x",
            style: TextStyle(
                color: appColorBlue, fontSize: 25, fontWeight: FontWeight.w400),
          ),
        ),
      )
    ],
  );
}
