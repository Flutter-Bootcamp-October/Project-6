import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 231,
      decoration: BoxDecoration(
        color: Color(0xfffcfcfc),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              offset: Offset(24, 32),
              color: const Color.fromARGB(36, 0, 0, 0),
              spreadRadius: 0,
              blurRadius: 58),
        ],
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Radio(
                      activeColor: Color(0xfffbcf7a),
                      value: 0,
                      groupValue: 0,
                      onChanged: (value) {},
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Icon(Icons.edit),
                ),
              ],
            ),
            Center(
              child: Text(
                '2972 Westheimer RD.\nSanta Ana, illinois 85486',
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Row(
                children: [
                  Icon(Icons.phone_android),
                  SizedBox(width: 8.0),
                  Text(
                    '123-456-7890',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
