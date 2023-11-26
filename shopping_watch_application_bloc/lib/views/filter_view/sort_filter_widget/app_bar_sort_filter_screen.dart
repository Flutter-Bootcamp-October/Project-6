import 'package:flutter/material.dart';
import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';

PreferredSizeWidget AppBarSortFilterScreen(BuildContext context) {
  return AppBar(
    centerTitle: true,
    title: const Text(
      "Sort Filter",
      style: TextStyle(color: appColorBlue, fontWeight: FontWeight.w400),
    ),
    backgroundColor: appColorWhite,
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
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
            Navigator.pop(context);
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
