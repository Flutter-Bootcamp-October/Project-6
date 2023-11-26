import 'package:flutter/material.dart';

class Paypal extends StatelessWidget {
  const Paypal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'lib/assets/images/paypal.png',
          height: 40,
          width: 40,
        ),
        const SizedBox(width: 24),
        const Text('Paypal'),
      ],
    );
  }
}
