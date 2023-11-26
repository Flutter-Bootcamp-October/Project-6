import 'package:flutter/material.dart';
import 'package:shopping_app/consts/colors.dart';

class RadioBotton extends StatelessWidget {
  const RadioBotton({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
        child: Container(
      width: 20,
      height: 20,
      color: isSelected ? appYellow : const Color(0xffcecccc),
      child: Center(
        child: Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
              color: isSelected ? Colors.transparent : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white, width: 2)),
        ),
      ),
    ));
  }
}
