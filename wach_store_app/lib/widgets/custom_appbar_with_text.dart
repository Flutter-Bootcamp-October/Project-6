import 'package:flutter/material.dart';

class CustomAppBarWithText extends StatelessWidget {
  CustomAppBarWithText({super.key, required this.letfonPressed});
  Function() letfonPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: letfonPressed,
          child: Icon(
            Icons.arrow_back_ios_new_sharp,
            size: 24,
          ),
        ),
        Text('Checkout'),
        Icon(
          Icons.cancel_outlined,
          size: 24,
        ),
      ],
    );
  }
}
