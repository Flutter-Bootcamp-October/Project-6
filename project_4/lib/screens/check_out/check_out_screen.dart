import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/bloc/cart_bloc/cart_bloc.dart';
import 'package:project_4/data/constants.dart';
import 'package:project_4/data/global_data.dart';
import 'package:project_4/widgets/payment_details.dart';
import 'package:project_4/widgets/custom_app_bar.dart';

import '../../widgets/custom_button.dart';

import 'widgets/address_row.dart';
import 'widgets/payment_method.dart';
import 'widgets/title_row.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "Checkout",
        context: context,
        hasAction: true,
        onPressedFunc: () {
          Navigator.pop(context);
        },
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleRow(content: "Your Order will be Delivered To"),
          SizedBox(height: 25),
          Expanded(flex: 1, child: AddressRow()),
          SizedBox(height: 25),
          TitleRow(content: "Payment Method"),
          SizedBox(height: 10),
          Expanded(flex: 1, child: PaymentMethod()),
          Expanded(flex: 2, child: PaymentDetails()),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) => CustomButton(
            content: 'Place Order',
            hasIcon: false,
            onPressedFunc: () {
              final total = grandTotal.value;
              context.read<CartBloc>().add(CartClearEvent(watch: cartList.last));
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog.adaptive(
                      title: const Text("Congratulations"),
                      content: Text(
                          "You have bought ${state.counter} item/s\nTotal cost = $rupeeIcon$total\n\nWe will contact you soon"),
                    );
                  }).then((value) {
                context.read<CartBloc>().add(CartResetCounter(watch: watchesList.last));
                Navigator.pop(context);
              });
            }),
      ),
    );
  }
}
