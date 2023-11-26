import 'package:flutter/material.dart';
import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';
import 'package:shopping_watch_application_bloc/views/filter_view/filter_screen.dart';

PreferredSizeWidget AppBarHomeScreen(BuildContext context) {
  return AppBar(
    backgroundColor: appColorWhite,
    elevation: 0,
    centerTitle: true,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/logo_app.png",
          height: 40,
          width: 40,
        ),
        const Text(
          "ADS Watch",
          style: TextStyle(
              color: appColorBlue,
              fontFamily: "PlayfairDisplay",
              fontSize: 17,
              fontWeight: FontWeight.bold),
        )
      ],
    ),
    actions: [
      IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const FilterScreen();
            }));
          },
          icon: const Icon(
            Icons.filter_list_rounded,
            color: appColorBlue,
            size: 30,
          ))
    ],
    leading: Image.asset(
      "assets/drawer.png",
    ),
  );
}
