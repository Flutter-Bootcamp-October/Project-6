import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.text, required this.onTap});
  String text;
  Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 55,
          width: 370,
          decoration: BoxDecoration(
            color: Color(0xfffcc972),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
              child: Text(
            text,
            style: TextStyle(fontSize: 18),
          )),
        ),
      ),
    );
  }
}
