import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.color,
      this.textSize,
      this.textFontFamily,
      this.textFontWeight,
      this.onPressed});
  final String text;
  final Color? color;
  final double? textSize;
  final String? textFontFamily;
  final FontWeight? textFontWeight;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: color,
            fontSize: textSize,
            fontFamily: textFontFamily,
            fontWeight: textFontWeight),
      ),
    );
  }
}
