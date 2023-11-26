import 'package:flutter/material.dart';
import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';

class CheckBox extends StatefulWidget {
  const CheckBox({super.key});

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool selectedAddress = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      side: const BorderSide(color: appColorGrey, width: 2),
      checkColor: appColorYellow,
      shape: const CircleBorder(),
      activeColor: appColorYellow,
      value: selectedAddress,
      onChanged: (Value) {
        selectedAddress = Value!;
        setState(() {});
      },
    );
  }
}
