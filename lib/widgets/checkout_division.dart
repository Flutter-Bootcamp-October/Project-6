import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CheckoutDivision extends StatelessWidget {
  CheckoutDivision({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontFamily: 'Crimson',
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: Color(0xff0f141d)),
        ),
      ],
    );
  }
}
