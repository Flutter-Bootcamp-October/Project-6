import 'package:flutter/material.dart';

class BlueBoldText extends StatelessWidget {
  BlueBoldText({super.key, required this.text, required this.size});
  String text;
  double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Crimson',
          fontSize: size,
          color: Color(0xff233a66),
          fontWeight: FontWeight.w900),
    );
  }
}
