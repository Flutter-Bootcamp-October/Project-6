import 'package:flutter/material.dart';

import '../../widgets/custom_app_bar.dart';
import 'widgets/my_order_list.dart';
import '../../widgets/payment_details.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "My Order", context: context, hasAction: true),
      body: const Column(
        children: [
          Expanded(flex: 2, child: MyOrderList()),
          Expanded(flex: 1, child: PaymentDetails()),
        ],
      ),
    );
  }
}
