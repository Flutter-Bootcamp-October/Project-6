import 'package:flutter/material.dart';
import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';
import 'package:shopping_watch_application_bloc/views/order_view/order_widget/amount_of_order_user.dart';
import 'package:shopping_watch_application_bloc/views/order_view/order_widget/check_out_order_buttom.dart';
import 'package:shopping_watch_application_bloc/views/order_view/order_widget/invoice_order_screen.dart';

class OrderInfoContent extends StatelessWidget {
  const OrderInfoContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AmountOfOrderContainer(),
        height20,
        InvoiceOrderScreen(),
        height30,
        CheckOutButtom(),
      ],
    );
  }
}
