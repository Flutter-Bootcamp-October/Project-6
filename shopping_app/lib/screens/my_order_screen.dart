import 'package:flutter/material.dart';
import 'package:shopping_app/consts/colors.dart';
import 'package:shopping_app/global/global.dart';
import 'package:shopping_app/screens/checkout.dart';
import 'package:shopping_app/widgets/button_widget.dart';
import 'package:shopping_app/widgets/my_app_bar.dart';
import 'package:shopping_app/widgets/show_order.dart';
import 'package:shopping_app/widgets/total_money.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
          leadingIcon: Icons.arrow_back_ios_new_rounded,
          title: "My Orders",
          actionIcon: Icons.close),
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
          buttonColor: appYellow,
          buttonChild: const Text(
            "Checkout",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            if (currentUser.cart.isNotEmpty) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const CheckoutScreen();
              }));
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Cart is Empty")));
            }
          },
          radius: 20),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
