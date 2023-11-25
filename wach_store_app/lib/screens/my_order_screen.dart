import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wach_store_app/blocs/bloc_cart/cart_bloc.dart';
import 'package:wach_store_app/blocs/bloc_cart/cart_event.dart';
import 'package:wach_store_app/blocs/bloc_cart/cart_state.dart';
import 'package:wach_store_app/global/global.dart';
import 'package:wach_store_app/screens/checkout_screen.dart';
import 'package:wach_store_app/widgets/appbar/app_bar.dart';
import 'package:wach_store_app/widgets/cart_widgets/cart_scroll.dart';
import 'package:wach_store_app/widgets/cart_widgets/data_details_section.dart';
import 'package:wach_store_app/widgets/edit_button.dart';
import 'package:wach_store_app/widgets/profile_widget/profile_textfield_widget.dart';

class MyCartScreen extends StatelessWidget {
  final TextEditingController couponController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // calculateGlobalPrice();
    // if (couponController.text == 'Flutter') {
    //   discountAmount = globalPrice * 0.25;
    //   grandTotal = globalPrice * discount;
    // } else {
    //   grandTotal = globalPrice;
    // }
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                    width: 200,
                    child: ProfileTextField(
                      Controller: couponController,
                      lable: 'Coupon',
                    ),
                  ),
                  SizedBox(width: 16),
                  SizedBox(
                    width: 90,
                    height: 40,
                    child: EditButton(
                      text: 'Apply',
                      onTap: () {
                        context
                            .read<CartBloc>()
                            .add(ApplyCouponEvent(couponController.text));
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
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
              const SizedBox(height: 12),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is CartUpdatedState) {
                    return DataDetailsSection(
                      title: 'Discount',
                      price: '\$ ${discountAmount}',
                      textColor: true,
                    );
                  }
                  return Container();
                },
              ),
              const SizedBox(height: 12),
              const DataDetailsSection(
                title: 'Delivery Free',
                textColor: false,
                price: 'Free',
              ),
              const SizedBox(height: 12),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(height: 12),
              BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                if (state is CartUpdatedState) {
                  return DataDetailsSection(
                    title: 'Grand Total',
                    textColor: true,
                    isGrandtotal: true,
                    price: "\$ ${grandTotal.toStringAsFixed(2)}",
                  );
                }
                return Container();
              }),
              SizedBox(height: 40),
              EditButton(
                text: 'Checkout',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckoutScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
