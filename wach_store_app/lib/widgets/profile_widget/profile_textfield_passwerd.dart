import 'package:flutter/material.dart';

class ProfileTextFieldPasswerd extends StatefulWidget {
  ProfileTextFieldPasswerd({
    super.key,
    required this.lable,
    required this.Controller,
  });
  final String lable;
  TextEditingController Controller;

  @override
  State<ProfileTextFieldPasswerd> createState() =>
      _ProfileTextFieldPasswerdState();
}

class _ProfileTextFieldPasswerdState extends State<ProfileTextFieldPasswerd> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObscured,
      controller: widget.Controller,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: isObscured
                ? Icon(Icons.visibility, color: Colors.grey)
                : Icon(Icons.visibility_off, color: Colors.grey),
            onPressed: () {
              isObscured = !isObscured;
              setState(() {});
            },
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.lable,
          labelStyle: const TextStyle(
              color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w800),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.white),
    );
  }
}
