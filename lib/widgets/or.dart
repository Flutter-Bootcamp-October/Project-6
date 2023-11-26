import 'package:flutter/material.dart';

class Or extends StatelessWidget {
  const Or({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Or',
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
