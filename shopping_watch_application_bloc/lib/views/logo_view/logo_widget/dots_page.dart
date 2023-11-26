import 'package:flutter/material.dart';

// this is custom widgets for logo page 
// for the dots colored for each page

class DotsLogoPageWidget extends StatelessWidget {
  const DotsLogoPageWidget({super.key, required this.colorDot});
  final Color colorDot;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: 6,
      decoration: BoxDecoration(color: colorDot, shape: BoxShape.circle),
    );
  }
}
