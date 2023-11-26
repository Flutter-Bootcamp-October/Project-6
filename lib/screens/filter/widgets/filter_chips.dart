import 'package:flutter/material.dart';

class FilterChips extends StatelessWidget {
  const FilterChips({
    super.key,
    required this.chipList,
  });

  final List<String> chipList;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ...List.generate(
          chipList.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
            child: Chip(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              padding: const EdgeInsets.all(14),
              label: Text(chipList[index]),
            ),
          ),
        )
      ],
    );
  }
}
