// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TwoText extends StatelessWidget {
  TwoText(
      {super.key,
      required this.leftText,
      required this.rightText,
      this.color = Colors.black});
  final String leftText;
  final String rightText;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: color),
          ),
          Text(rightText,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: color))
        ],
      ),
    );
  }
}
