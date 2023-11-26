import 'package:flutter/material.dart';
import 'package:project_6/widgets/payment_details.dart';
import 'package:project_6/widgets/custom_app_bar.dart';

import 'widgets/address_row.dart';
import 'widgets/payment_method.dart';
import 'widgets/title_row.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          customAppBar(title: "Checkout", context: context, hasAction: true),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleRow(content: "Your Order will be Delivered To"),
          SizedBox(height: 25),
          Expanded(
            flex: 1,
            child: AddressRow(),
          ),
          SizedBox(height: 25),
          TitleRow(content: "Payment Method"),
          SizedBox(height: 10),
          Expanded(flex: 1, child: PaymentMethod()),
          Expanded(flex: 2, child: PaymentDetails()),
        ],
      ),
    );
  }
}
