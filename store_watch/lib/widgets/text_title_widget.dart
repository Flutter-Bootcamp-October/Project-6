import 'package:flutter/material.dart';

class TextTitleWidget extends StatelessWidget {
  const TextTitleWidget({super.key, required this.textTitle});

  final String textTitle;
  @override
  Widget build(BuildContext context) {
    return Text(
      textTitle,
      style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'NotoSerif'),
    );
  }
}
