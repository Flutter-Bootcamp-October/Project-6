import 'package:flutter/material.dart';
//7
class Circle extends StatelessWidget {
  const Circle({super.key, required this.circleColor});
  final Color circleColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ClipOval(
        child: Container(
          width: 8,
          height: 8,
          color: circleColor,
        ),
      ),
    );
  }
}
