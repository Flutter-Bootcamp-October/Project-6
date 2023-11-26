import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 350,
        height: 50,
        decoration: BoxDecoration(
            color: const Color(0xfffbcf7a),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
          ),
        )),
      ),
    );
  }
}
