import 'package:flutter/material.dart';

class BackgroundPic extends StatelessWidget {
  const BackgroundPic({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        "assets/background.png",
        fit: BoxFit.fill,
      ),
    );
  }
}
