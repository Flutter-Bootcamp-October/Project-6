import 'package:flutter/material.dart';

IconData? icon;
String? title;
final bool visibal = true;
late final Function() onTap;
appbar(BuildContext context, visibal, icon, title, onTap) {
  return AppBar(
    elevation: 0,
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
      ),
      onPressed: onTap,
    ),
    centerTitle: true,
    title: Text(
      title!,
      style: TextStyle(fontFamily: 'Crimson'),
    ),
    actions: [
      Visibility(
        visible: visibal,
        child: IconButton(
          icon: Icon(icon, color: Colors.black),
          onPressed: () {},
        ),
      ),
    ],
  );
}
