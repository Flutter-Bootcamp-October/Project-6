import 'package:flutter/material.dart';

class BrandCard extends StatelessWidget {
  BrandCard({super.key, required this.src});
  String src;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      width: 113,
      decoration: BoxDecoration(
          color: Color(0xfff9f9f9), borderRadius: BorderRadius.circular(20)),
      child: Center(child: Image.asset(src)),
    );
  }
}
