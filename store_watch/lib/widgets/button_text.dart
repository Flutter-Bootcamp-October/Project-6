import 'package:flutter/material.dart';

//6
class ButtonText extends StatelessWidget {
  const ButtonText(
      {super.key,
      required this.title,
      required this.titleButton,
      required this.onTap});

  final String title;
  final String titleButton;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(title,
          style: const TextStyle(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500)),
      InkWell(
        onTap: onTap,
        child: Text(
          titleButton,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff2c436d),
          ),
        ),
      )
    ]);
  }
}
