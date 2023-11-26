import 'package:flutter/material.dart';

PreferredSizeWidget detailsScreenAppBar() {
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
          Icons.shopping_basket_outlined,
          color: Colors.black,
          size: 25,
        ),
        SizedBox(
          width: 12,
        )
      ],
      title: Text(
        "product name",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
      ));
}
