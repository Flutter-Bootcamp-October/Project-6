import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'lib/assets/images/mastercard.png',
          height: 40,
          width: 40,
        ),
        const SizedBox(width: 24),
        const Text('Credit/Debit Card'),
      ],
    );
  }
}
