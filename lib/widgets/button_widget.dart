import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key, required this.textButton, required this.onPressed});
  final String textButton;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xfffcc873),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      onPressed: onPressed,
      child: Text(
        textButton,
        style: const TextStyle(color: Color(0xff4a4132)),
      ),
    );
  }
}
