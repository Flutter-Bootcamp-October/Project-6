import 'package:flutter/material.dart';
import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';

class PlaceOrderButtom extends StatelessWidget {
  const PlaceOrderButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showAdaptiveDialog(
            context: context,
            builder: (context) {
              return AlertDialog.adaptive(
                title: const Text(
                  "Your order is in progress ",
                  style: TextStyle(
                      fontFamily: 'PlayfairDisplay',
                      fontWeight: FontWeight.bold,
                      color: appColorBlue),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Center(
                        child: Text(
                          "OK",
                          style: TextStyle(
                              fontFamily: 'PlayfairDisplay',
                              fontWeight: FontWeight.bold,
                              color: appColorGreen),
                        ),
                      ))
                ],
              );
            });
      },
      child: Container(
        height: 50,
        width: 350,
        decoration: BoxDecoration(
          color: appColorYellow,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
            child: Text(
          "Place Order",
          style: TextStyle(fontSize: 15, color: appColorBlue),
        )),
      ),
    );
  }
}
