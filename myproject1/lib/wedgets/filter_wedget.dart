
import 'package:flutter/material.dart';

class FilterWedget extends StatefulWidget {
   final String text;
  const FilterWedget({
    super.key, required this.text,
  });

  @override
  State<FilterWedget> createState() => _FilterWedgetState();
}
  Color color = Color(0xfffcc77b); // Default color


class _FilterWedgetState extends State<FilterWedget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
 setState(() {
      color = color == Color(0xfffcc77b) ? Colors.green : Color(0xfffcc77b);
    });
      },
      child: Container(width: 90,height: 50,decoration: BoxDecoration(
        color: color,borderRadius: BorderRadiusDirectional.circular(20)),
        child: Center(child: Text(widget.text)),),
    );
  }
}