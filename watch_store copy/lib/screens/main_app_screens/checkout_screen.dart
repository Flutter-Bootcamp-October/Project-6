import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:watch_store/blocs/product_bloc/product_bloc.dart';
import 'package:watch_store/global/global.dart';
import 'package:watch_store/styles/custom_colors.dart';
import 'package:watch_store/widgets/address_bottom_sheet.dart';
import 'package:watch_store/widgets/location.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
      backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            "Checkout",
            style: TextStyle(color: black),
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          Icon(
            Icons.clear,
            color: black,
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: Column(
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 220),
                child: Text(
                  "Your order will be\nDelivered To",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  return currentUser.location.isNotEmpty
                      ? const Location()
                      : Column(
                          children: [
                            const Text("You don't Have address"),
                            InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return const AddressBottomSheet();
                                    },
                                  );
                                },
                                child: const Icon(Icons.add))
                          ],
                        );
                },
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 220),
            child: Text(
              "Payment Method",
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Row(
                children: [
                  SizedBox(
                      height: 70,
                      width: 70,
                      child: Image.asset(
                          "assets/Screenshot 2023-11-04 164431.png")),
                  const Text("Credit/Debit Card")
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    Icon(
                      IonIcons.logo_paypal,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Paypal")
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Item Total:",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "\$ ${currentUser.total.toString()}",
                  style: const TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 23.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Discount",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "\$ 0.0",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 23.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Deliery Free:",
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
                Text(
                  "Free",
                  style: TextStyle(fontSize: 18, color: Colors.green),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(
              thickness: 1,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Grand Total:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$ ${currentUser.total.toString()}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: primary),
            child: const Center(
              child: Text(
                'Place Order',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
