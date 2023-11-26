import 'package:flutter/material.dart';
import 'package:project_6/screens/check_out/widgets/payment_details_cost.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        PaymentDetailsCost(
          leadingText: "Item Total",
          trailingText: "10,849.00",
        ),
        PaymentDetailsCost(
          leadingText: "Discount",
          trailingText: "849.00",
        ),
        PaymentDetailsCost(
          leadingText: "Delivery Free",
          trailingText: "Free",
          color: Colors.green,
        ),
        Divider(
          thickness: 1.5,
          indent: 20,
          endIndent: 20,
        ),
        PaymentDetailsCost(
          leadingText: "Grand Total",
          trailingText: "10,000.00",
        ),
      ],
    );
  }
}
