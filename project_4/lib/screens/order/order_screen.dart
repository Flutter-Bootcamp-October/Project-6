import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/bloc/buttom_nav_bloc/bottom_nav_bloc.dart';
import 'package:project_4/bloc/cart_bloc/cart_bloc.dart';

import 'package:project_4/models/watch_model.dart';

import 'package:project_4/screens/NavigationBar/navigation_bar_widget.dart';
import 'package:project_4/screens/check_out/check_out_screen.dart';
import 'package:project_4/widgets/custom_button.dart';

import '../../data/global_data.dart';
import '../../widgets/custom_app_bar.dart';
import 'widgets/my_order_list.dart';
import '../../widgets/payment_details.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key, this.watch, required this.isBottomNavBar}) : super(key: key);
  final Watch? watch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          title: "My Order",
          context: context,
          hasAction: true,
          onPressedFunc: () {
            if (isBottomNavBar) {
              context.read<BottomNavBloc>().add(ChangeIndexEvent(index: 0));
            } else {
              Navigator.pop(context);
            }
          }),
      body: WillPopScope(
        onWillPop: () {
          if (isBottomNavBar) {
            context.read<BottomNavBloc>().add(ChangeIndexEvent(index: 0));
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const BottomNavBar()));
          } else {
            Navigator.pop(context);
          }
          return Future.value(true);
        },
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  flex: 3,
                  child: (cartList.isNotEmpty)
                      ? const MyOrderList()
                      : Image.asset("assets/images/cart-empty.png"),
                ),
                const Expanded(flex: 2, child: PaymentDetails()),
              ],
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButton(
        content: 'Checkout',
        hasIcon: false,
        onPressedFunc: () {
          if (cartList.isNotEmpty) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const CheckOutScreen()));
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Your cart is empty")));
          }
        },
      ),
    );
  }

  final bool isBottomNavBar;
}
