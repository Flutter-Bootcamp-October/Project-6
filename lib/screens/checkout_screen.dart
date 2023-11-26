import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wach_store_app/BLoCs/cart_bloc/cart_bloc.dart';
import 'package:wach_store_app/BLoCs/cart_bloc/cart_event.dart';
import 'package:wach_store_app/BLoCs/cart_bloc/cart_state.dart';
import 'package:wach_store_app/global/global.dart';
import 'package:wach_store_app/widgets/add_address_card.dart';
import 'package:wach_store_app/widgets/address_card.dart';
import 'package:wach_store_app/widgets/appbar/app_bar.dart';
import 'package:wach_store_app/widgets/cart_widgets/data_details_section.dart';
import 'package:wach_store_app/widgets/checkout_division.dart';
import 'package:wach_store_app/widgets/credit_card.dart';
import 'package:wach_store_app/widgets/edit_button.dart';
import 'package:wach_store_app/widgets/paypal.dart';

// ignore: must_be_immutable
class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});

  String currentOption = options[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, true, Icons.close, 'Checkout', () {
        Navigator.pop(context);
      }),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 24),
              CheckoutDivision(title: 'Your Order Will Be\nDelivered To'),
              const SizedBox(height: 24),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      height: 250,
                    ),
                    AddAddressCard(),
                    SizedBox(width: 24),
                    AddressCard(),
                    SizedBox(width: 24),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              CheckoutDivision(title: 'Payment Method'),
              const SizedBox(height: 24),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is ChoosePaymentState) {
                    currentOption = state.option;
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CreditCard(),
                            Radio(
                                value: options[0],
                                groupValue: currentOption,
                                onChanged: (value) {
                                  currentOption = value.toString();
                                  context.read<CartBloc>().add(
                                      ChoosePaymentEvent(
                                          option: currentOption));
                                }),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Paypal(),
                            Radio(
                                value: options[1],
                                groupValue: currentOption,
                                onChanged: (value) {
                                  currentOption = value.toString();
                                  context.read<CartBloc>().add(
                                      ChoosePaymentEvent(
                                          option: currentOption));
                                }),
                          ],
                        ),
                      ],
                    );
                  }
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CreditCard(),
                          Radio(
                              value: options[0],
                              groupValue: currentOption,
                              onChanged: (value) {
                                currentOption = value.toString();
                                context.read<CartBloc>().add(
                                    ChoosePaymentEvent(option: currentOption));
                              }),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Paypal(),
                          Radio(
                              value: options[1],
                              groupValue: currentOption,
                              onChanged: (value) {
                                currentOption = value.toString();
                                context.read<CartBloc>().add(
                                    ChoosePaymentEvent(option: currentOption));
                              }),
                        ],
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 24),
              DataDetailsSection(
                title: 'Item Total',
                price: "\$ ${globalPrice.toStringAsFixed(2)}",
                textColor: true,
              ),
              const SizedBox(height: 12),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return const DataDetailsSection(
                    title: 'Discount',
                    price: '\$ 0.00',
                    textColor: true,
                  );
                },
              ),
              const SizedBox(height: 12),
              const DataDetailsSection(
                title: 'Delivery Free',
                textColor: false,
                price: 'Free',
              ),
              const SizedBox(height: 12),
              const Divider(thickness: 1),
              const SizedBox(height: 12),
              DataDetailsSection(
                title: 'Grand Total',
                textColor: true,
                isGrandtotal: true,
                price: '\$ ${globalPrice.toStringAsFixed(2)}',
              ),
              const SizedBox(height: 32),
              EditButton(
                text: 'Place Order',
                onTap: () {},
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
