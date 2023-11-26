import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wach_store_app/BLoCs/cart_bloc/cart_bloc.dart';
import 'package:wach_store_app/BLoCs/cart_bloc/cart_state.dart';
import 'package:wach_store_app/global/global.dart';
import 'package:wach_store_app/screens/checkout_screen.dart';
import 'package:wach_store_app/widgets/appbar/app_bar.dart';
import 'package:wach_store_app/widgets/cart_widgets/cart_scroll.dart';
import 'package:wach_store_app/widgets/cart_widgets/data_details_section.dart';
import 'package:wach_store_app/widgets/edit_button.dart';

// ignore: must_be_immutable
class CartScreen extends StatelessWidget {
  TextEditingController copunController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    calculateGlobalPrice();
    return Scaffold(
      appBar: appbar(context, true, Icons.close, 'My Order', () {
        Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              CartScroll(),
              SizedBox(height: 40),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return DataDetailsSection(
                    title: 'Item Total',
                    price: "\$ ${globalPrice.toStringAsFixed(2)}",
                    textColor: true,
                  );
                },
              ),
              const SizedBox(
                height: 12,
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return const DataDetailsSection(
                    title: 'Discount',
                    price: '\$ 0.00',
                    textColor: true,
                  );
                },
              ),
              const SizedBox(
                height: 12,
              ),
              const DataDetailsSection(
                title: 'Delivery Free',
                textColor: false,
                price: 'Free',
              ),
              const SizedBox(
                height: 12,
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(
                height: 12,
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return DataDetailsSection(
                    title: 'Grand Total',
                    textColor: true,
                    isGrandtotal: true,
                    price: '\$ ${globalPrice.toStringAsFixed(2)}',
                  );
                },
              ),
              SizedBox(height: 40),
              EditButton(
                text: 'Checkout',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CheckoutScreen()));
                },
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
