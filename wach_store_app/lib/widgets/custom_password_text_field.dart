import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class CustomPasswordTextField extends StatefulWidget {
  CustomPasswordTextField({
    super.key,
    required this.hint,
    required this.label,
    required this.icon,
    required this.controller,
  });
  IconData icon;
  String hint;
  String label;

  TextEditingController controller;

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool isScure = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isScure,
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: isScure
              ? Icon(Icons.visibility, color: Colors.grey)
              : Icon(Icons.visibility_off, color: Colors.grey),
          onPressed: () {
            isScure = !isScure;
            setState(() {});
          },
        ),
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
      ),
    ).asGlass();
  }
}
