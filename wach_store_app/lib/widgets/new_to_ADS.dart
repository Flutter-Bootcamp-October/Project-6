import 'package:flutter/material.dart';

class MemberCheck extends StatelessWidget {
  MemberCheck(
      {super.key,
      required this.leftText,
      required this.rightText,
      required this.onTap});
  String leftText;
  String rightText;
  Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          leftText,
          style: TextStyle(fontSize: 16),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            rightText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: Color(0xff2c456e),
            ),
          ),
        ),
      ],
    );
  }
}
