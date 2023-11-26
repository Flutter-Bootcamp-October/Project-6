import 'package:flutter/material.dart';

class LogoADS extends StatelessWidget {
  const LogoADS({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 5,
      top: 50,
      child: Image.asset(
        "assets/logo_app.png",
        height: 120,
        width: 120,
      ),
    );
  }
}
