import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

//8
class GlassTextFiled extends StatelessWidget {
  const GlassTextFiled(
      {super.key,
      required this.hint,
      required this.labelText,
      required this.icon,
      required this.isPassword,
      required this.controller});

  final String hint;
  final String labelText;
  final IconData icon;
  final bool isPassword;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: TextField(
        controller: controller,
        obscureText: isPassword ? true : false,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 22, horizontal: 32),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
          labelText: labelText,
          labelStyle: const TextStyle(fontSize: 18),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.4)),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 22),
            child: Icon(
              icon,
              color: const Color(0xff999799),
            ),
          ),
        ),
      ),
    ).asGlass(clipBorderRadius: BorderRadius.circular(14));
  }
}
