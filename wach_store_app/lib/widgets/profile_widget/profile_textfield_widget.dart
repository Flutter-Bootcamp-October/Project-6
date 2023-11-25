import 'package:flutter/material.dart';

class ProfileTextField extends StatefulWidget {
  ProfileTextField({
    super.key,
    required this.lable,
    required this.Controller,
  });
  final String lable;
  TextEditingController Controller;

  @override
  State<ProfileTextField> createState() => _ProfileTextFieldState();
}

class _ProfileTextFieldState extends State<ProfileTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.Controller,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.lable,
          labelStyle: const TextStyle(
              fontFamily: 'Crimson',
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w800),
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
