import 'package:flutter/material.dart';
import 'package:shopping_app/consts/colors.dart';

class FilterCriteria extends StatelessWidget {
  const FilterCriteria(
      {super.key, required this.text, required this.isSelected});
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: isSelected ? appYellow : const Color(0xfff3f3f3),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
