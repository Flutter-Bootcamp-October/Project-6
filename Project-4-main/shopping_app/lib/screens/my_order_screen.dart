import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/bloc/cart_bloc/cart_bloc.dart';
import 'package:shopping_app/global/global.dart';
import 'package:shopping_app/screens/checkout.dart';
import 'package:shopping_app/widgets/button_widget.dart';
import 'package:shopping_app/widgets/show_order.dart';
import 'package:shopping_app/widgets/total_money.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is EmptyCartState) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("My Orders"),
              ),
              body: const Center(child: Text("cart is empty")));
        } else if (state is UpdateCartState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("My Orders"),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: currentUser.cart.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ShowOrder(product: currentUser.cart[index]);
                        }),
                    // ignore: prefer_const_constructors
                    TotalMoney(),
                    const SizedBox(height: 80)
                  ],
                ),
              ),
            ),
            floatingActionButton: ButtonCustom(
                buttonChild: const Text(
                  "Checkout",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const CheckoutScreen();
                  }));
                },
                radius: 20),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
