import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Forget Password?',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xff4b5e83),
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
