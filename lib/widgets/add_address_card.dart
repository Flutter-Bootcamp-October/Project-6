import 'package:flutter/material.dart';

class AddAddressCard extends StatelessWidget {
  const AddAddressCard({
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
        border: Border.all(),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Add Your Address Here',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                // color: Color(0xff233a66),
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Icon(
              Icons.add,
              size: 32,
            )
          ],
        ),
      ),
    );
  }
}
