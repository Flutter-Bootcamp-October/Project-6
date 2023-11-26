import 'package:flutter/material.dart';
//12
class ProfileTextFiled extends StatefulWidget {
  const ProfileTextFiled(
      {super.key,
      required this.hint,
      required this.labelText,
      this.icon,
      required this.isPassword,
      required this.controller});

  final String hint;
  final String labelText;
  final IconData? icon;
  final bool isPassword;
  final TextEditingController controller;

  @override
  State<ProfileTextFiled> createState() => _ProfileTextFiledState();
}

class _ProfileTextFiledState extends State<ProfileTextFiled> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        child: TextField(
          controller: widget.controller,
          obscureText: widget.isPassword ? true : false,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 22, horizontal: 32),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
            labelText: widget.labelText,
            labelStyle: const TextStyle(fontSize: 18),
            hintText: widget.hint,
            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.4)),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 22),
              child: Icon(
                widget.icon,
                color: const Color(0xff999799),
              ),
            ),
          ),
        ));
  }
}
