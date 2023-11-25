import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {super.key,
      required this.hint,
      required this.label,
      required this.icon,
      required this.controller,
      required this.isPass});
  IconData icon;
  String hint;
  String label;
  bool isPass = false;
  TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isScure = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isPass,
      controller: widget.controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff9d9a9d)),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff9d9a9d)),
            borderRadius: BorderRadius.circular(10)),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff9d9a9d)),
            borderRadius: BorderRadius.circular(10)),
        hintText: widget.hint,
        hintStyle: TextStyle(color: Color(0xffeaebea)),
        labelText: widget.label,
        labelStyle: TextStyle(color: Color(0xff9d9a9d)),
        filled: true,
        fillColor: Color(0xfffffefe).withOpacity(0.5),
        suffixIcon: Icon(
          widget.icon,
          color: Color(0xff9d9a9d),
        ),
      ),
    ).asGlass();
  }
}
