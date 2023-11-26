import 'package:flutter/material.dart';

class SignInLogo extends StatelessWidget {
  const SignInLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'lib/assets/images/sign-logo.jpeg',
      height: 100,
      width: 100,
    );
  }
}
