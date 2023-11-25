import 'package:flutter/material.dart';

class CategortWidget extends StatelessWidget {
  const CategortWidget({
    super.key,
    required this.containerWidth,
    required this.containerHeight,
    required this.textContainer,
    required this.onPressed,
    required this.containerColor,
  });

  final Function() onPressed;
  final double containerWidth;
  final double containerHeight;
  final String textContainer;
  final Color containerColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: containerWidth,
        height: containerHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: containerColor,
        ),
        child: Center(
          child: Text(
            textContainer,
            style: const TextStyle(color: Color(0xff2f343b), fontSize: 16),
          ),
        ),
      ),
    );
  }
}
