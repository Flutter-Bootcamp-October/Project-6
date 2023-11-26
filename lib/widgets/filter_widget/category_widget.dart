import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  CategoryWidget({
    Key? key,
    required this.text,
    this.isTextlong = false,
  }) : super(key: key);

  final String text;
  final bool isTextlong;

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Container(
          width: widget.isTextlong ? 160 : 100,
          height: 50,
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xfffbcf7a)
                : const Color.fromARGB(255, 238, 238, 238),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              widget.text,
              style: const TextStyle(
                fontFamily: 'Crimson',
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
