import 'package:flutter/material.dart';
import '/screens/checkout_screen.dart';

class AdressWidget extends StatefulWidget {
  const AdressWidget({super.key});

  @override
  State<AdressWidget> createState() => _AdressWidgetState();
}

class _AdressWidgetState extends State<AdressWidget> {
  int groupValue = 1;

  String getGroup() {
    String group = '';
    switch (groupValue) {
      case 1:
        group = 'Home';
        break;
      case 2:
        group = 'Work';
        break;
    }
    return group;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 220,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: const Color(0xffffffff),
          boxShadow: const [
            BoxShadow(
              color: Color(0xffefefef),
              spreadRadius: 5,
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Radio(
                      value: 1, groupValue: groupValue, onChanged: (value) {}),
                  const Text(
                    "Home",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.mode_edit_outlined,
                      color: Color(0xff11151e),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              const Text(
                "2972 Westheimer Rd,",
                style: TextStyle(color: Color(0xffb5b2b2)),
              ),
              Row(
                children: const [
                  Icon(
                    Icons.phone_iphone,
                    color: Color(0xff0f141d),
                  ),
                  Text(
                    "+61 2 4916 1349",
                    style: TextStyle(color: Color(0xff4a4e54)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
