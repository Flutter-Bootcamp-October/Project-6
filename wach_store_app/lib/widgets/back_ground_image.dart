import 'package:flutter/material.dart';

class BackGroundImage extends StatelessWidget {
  BackGroundImage({super.key, required this.src});
  String src;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 150,
      top: 120,
      child: Transform.rotate(
        angle: 0.25,
        child: Image.asset(
          src,
          height: 400,
          width: 400,
        ),
      ),
    );
  }
}
