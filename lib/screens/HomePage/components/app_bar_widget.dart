import 'package:flutter/material.dart';

PreferredSizeWidget homeAppBarWidget() {
  return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const Icon(
        Icons.menu,
        color: Colors.black,
        size: 25,
      ),
      actions: const [
        Icon(
          Icons.filter_list,
          color: Colors.black,
          size: 25,
        ),
        SizedBox(
          width: 12,
        )
      ],
      title: Image.asset(
        'assets/images/appbar_logo.png',
        height: 25,
      ));
}
