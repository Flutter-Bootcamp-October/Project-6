import 'package:flutter/material.dart';
import 'package:wach_store_app/screens/filter_screen.dart';

IconData? icon;
String? title;
final bool visibal = true;
late final Function() onTap;
appbarWithImage(BuildContext context, visibal, icon, title, onTap) {
  return AppBar(
    elevation: 0,
    leading: Stack(
      children: [
        IconButton(
          icon: const Icon(Icons.format_list_bulleted_outlined,
              color: Colors.black),
          onPressed: onTap,
        ),
        Positioned(
          bottom: 32,
          left: 28,
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black,
            ),
          ),
        )
      ],
    ),
    centerTitle: true,
    title: Image.asset(
      'lib/assets/images/appbar_logo.png',
      height: 32,
    ),
    actions: [
      Visibility(
        visible: visibal,
        child: IconButton(
          icon: Icon(icon, color: Colors.black),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FilterScreen()));
          },
        ),
      ),
    ],
  );
}
