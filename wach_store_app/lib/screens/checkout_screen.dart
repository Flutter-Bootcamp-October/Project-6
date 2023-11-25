import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wach_store_app/blocs/bloc_cart/cart_bloc.dart';
import 'package:wach_store_app/blocs/bloc_cart/cart_event.dart';
import 'package:wach_store_app/blocs/bloc_cart/cart_state.dart';
import 'package:wach_store_app/global/global.dart';
import 'package:wach_store_app/models/wach_model.dart';
import 'package:wach_store_app/widgets/add_address_card.dart';
import 'package:wach_store_app/widgets/address_card.dart';
import 'package:wach_store_app/widgets/appbar/app_bar.dart';
import 'package:wach_store_app/widgets/cart_widgets/data_details_section.dart';
import 'package:wach_store_app/widgets/checkout_division.dart';
import 'package:wach_store_app/widgets/edit_button.dart';

List<String> options = ['mastercard', 'paypal'];

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});
  WatchProduct? products;
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
              SizedBox(height: 24),
              CheckoutDivision(title: 'Your Order Will Be\nDelivered To'),
              SizedBox(height: 24),
              SingleChildScrollView(
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
              SizedBox(height: 40),
              CheckoutDivision(title: 'Payment Method'),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'lib/assets/images/mastercard.png',
                        height: 40,
                        width: 40,
                      ),
                      SizedBox(width: 24),
                      Text('Credit/Debit Card'),
                    ],
                  ),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      return Radio(
                        value: options[1],
                        groupValue: state is CartUpdatedState
                            ? state.currentOption
                            : options[0],
                        onChanged: (value) {
                          context.read<CartBloc>().add(
                                UpdatePaymentOptionEvent(value.toString()),
                              );
                        },
                      );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'lib/assets/images/paypal.png',
                        height: 40,
                        width: 40,
                      ),
                      SizedBox(width: 24),
                      Text('Paypal'),
                    ],
                  ),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      return Radio(
                        value: options[1],
                        groupValue: state is CartUpdatedState
                            ? state.currentOption
                            : options[0],
                        onChanged: (value) {
                          context.read<CartBloc>().add(
                                UpdatePaymentOptionEvent(value.toString()),
                              );
                        },
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 24),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is CartUpdatedState) {
                    return DataDetailsSection(
                      title: 'Item Total',
                      price: "\$ ${globalPrice.toStringAsFixed(2)}",
                      textColor: true,
                    );
                  }
                  return Container();
                },
              ),
              const SizedBox(
                height: 12,
              ),
              DataDetailsSection(
                title: 'Discount',
                price: '\$ $discountAmount',
                textColor: true,
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
                  if (state is CartUpdatedState) {
                    return DataDetailsSection(
                      title: 'Grand Total',
                      textColor: true,
                      isGrandtotal: true,
                      price: '\$${grandTotal.toStringAsFixed(2)}',
                    );
                  }

                  return Container();
                },
              ),
              SizedBox(height: 32),
              EditButton(
                text: 'Place Order',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
