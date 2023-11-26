import 'package:flutter/material.dart';
import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';
import 'package:shopping_watch_application_bloc/views/checkout_view/checkout_widget/checkbox.dart';

class PaymentChosse extends StatelessWidget {
  const PaymentChosse({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/Mastercard Logo.png",
                    height: 50,
                    width: 50,
                  ),
                ),
                width12,
                const Text("Credit/Debit Card"),
              ],
            ),
            const CheckBox()
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/PayPal logo.png",
                    height: 50,
                    width: 50,
                  ),
                ),
                width12,
                const Text("Credit/Debit Card"),
              ],
            ),
            const CheckBox()
          ],
        )
      ],
    );
  }
}
