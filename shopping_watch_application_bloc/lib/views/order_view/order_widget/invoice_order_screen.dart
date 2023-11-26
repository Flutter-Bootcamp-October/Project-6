import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_watch_application_bloc/Data/global.dart';
import 'package:shopping_watch_application_bloc/blocs/card_bloc/cart_bloc.dart';
import 'package:shopping_watch_application_bloc/blocs/card_bloc/cart_state.dart';
import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';

class InvoiceOrderScreen extends StatelessWidget {
  const InvoiceOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Item Total",
                style: TextStyle(color: appColorBlue),
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return Text(
                    "\$ ${calculateGlobalPrice()}",
                    style: const TextStyle(color: appColorBlue),
                  );
                },
              )
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Discount",
                style: TextStyle(color: appColorBlue),
              ),
              Text(
                "\$ 24.30",
                style: TextStyle(color: appColorBlue),
              )
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery Free",
                style: TextStyle(color: appColorGreen),
              ),
              Text(
                "Free",
                style: TextStyle(color: appColorGreen),
              )
            ],
          ),
          const Divider(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Grand Total",
                style: TextStyle(color: appColorBlue),
              ),
              Text(
                "\$ 100000",
                style: TextStyle(color: appColorBlue),
              )
            ],
          ),
        ],
      ),
    );
  }
}
