import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.title, required this.subTitle});
//9
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: "NotoSerif",
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xff233b67),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subTitle,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
