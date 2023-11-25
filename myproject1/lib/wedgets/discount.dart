import 'package:flutter/material.dart';
import 'package:shopingpriject/data/global.dart';

Padding Discount() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Discount",
          style: TextStyle(fontSize: 17),
        ),
        Text(
          "\$${(globalPrice / 22).toStringAsFixed(2)}",
          style: TextStyle(fontSize: 17),
        )
      ],
    ),
  );
}
