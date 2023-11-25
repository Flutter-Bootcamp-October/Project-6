import 'package:flutter/material.dart';

class HomeDivision extends StatelessWidget {
  HomeDivision({super.key, required this.title});
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
        Text('See All',
            style: TextStyle(
                fontFamily: 'Crimson',
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Color(0xff506287))),
      ],
    );
  }
}
