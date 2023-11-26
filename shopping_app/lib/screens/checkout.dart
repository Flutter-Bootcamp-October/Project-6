import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/bloc/checkout_bloc/checkout_bloc.dart';
import 'package:shopping_app/bloc/checkout_bloc/checkout_event.dart';
import 'package:shopping_app/bloc/checkout_bloc/checkout_state.dart';
import 'package:shopping_app/consts/colors.dart';
import 'package:shopping_app/global/global.dart';
import 'package:shopping_app/screens/bottom_nav_bar.dart';
import 'package:shopping_app/widgets/addrees.dart';
import 'package:shopping_app/widgets/button_widget.dart';
import 'package:shopping_app/widgets/my_app_bar.dart';
import 'package:shopping_app/widgets/radio_button.dart';
import 'package:shopping_app/widgets/total_money.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedAdress = 0;
    int selectedPayment = -1;
    return Scaffold(
      appBar: const MyAppBar(
          leadingIcon: Icons.arrow_back_ios_new_rounded,
          title: "Checkout",
          actionIcon: Icons.close),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              "your order will be\ndelivered to",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: InkWell(
                  onTap: () {
                    context.read<CheckoutBloc>().add(ChooseAdreesEvent(0));
                  },
                  child: BlocConsumer<CheckoutBloc, CheckoutState>(
                    listener: (context, state) {
                      if (state is ChangeAddressState) {
                        selectedAdress = state.choise;
                      }
                    },
                    builder: (context, state) {
                      return Address(
                        address: "Home",
                        addressInfo1: "3321 Albatalyah AlAhsaa .St",
                        addressInfo2: "Kinkdom of Saudi Arabia",
                        mobileNumber: "+966 53 33 5585",
                        isSelected: selectedAdress == 0,
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: InkWell(
                  onTap: () {
                    context.read<CheckoutBloc>().add(ChooseAdreesEvent(1));
                  },
                  child: BlocConsumer<CheckoutBloc, CheckoutState>(
                    listener: (context, state) {
                      if (state is ChangeAddressState) {
                        selectedAdress = state.choise;
                      }
                    },
                    builder: (context, state) {
                      return Address(
                        address: "Work",
                        addressInfo1: "Dammam Street 121.st",
                        addressInfo2: "Kingdom of Suadi Arabia",
                        mobileNumber: "+110 53 33 5585",
                        isSelected: selectedAdress == 1,
                      );
                    },
                  ),
                ),
              ),
            ]),
          ),
          const Text("Pament Method",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          InkWell(
            onTap: () {
              context.read<CheckoutBloc>().add(ChoosePaymentEvent(0));
            },
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child:
                      Icon(Icons.credit_card_rounded, color: Colors.blueGrey),
                ),
                const SizedBox(width: 16),
                const Text("Credit/Debit Card"),
                const Spacer(),
                BlocConsumer<CheckoutBloc, CheckoutState>(
                  listener: (context, state) {
                    if (state is ChangePaymentState) {
                      selectedPayment = state.choise;
                    }
                  },
                  builder: (context, state) {
                    return RadioBotton(isSelected: selectedPayment == 0);
                  },
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              context.read<CheckoutBloc>().add(ChoosePaymentEvent(1));
            },
            child: Row(
              children: [
                const Icon(Icons.paypal, color: Colors.blue),
                const SizedBox(width: 16),
                const Text("PayPal"),
                const Spacer(),
                BlocConsumer<CheckoutBloc, CheckoutState>(
                  listener: (context, state) {
                    if (state is ChangePaymentState) {
                      selectedPayment = state.choise;
                    }
                  },
                  builder: (context, state) {
                    return RadioBotton(isSelected: selectedPayment == 1);
                  },
                )
              ],
            ),
          ),
          const SizedBox(height: 32),
          const TotalMoney(),
        ]),
      ),
      floatingActionButton: ButtonCustom(
          buttonColor: appYellow,
          buttonChild: const Text(
            "Place Order",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            if (selectedPayment != -1) {
              currentUser.cart = [];
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AppBottonNabBar()),
                  (route) => false);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Choose Pament Method")));
            }
          },
          radius: 20),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
