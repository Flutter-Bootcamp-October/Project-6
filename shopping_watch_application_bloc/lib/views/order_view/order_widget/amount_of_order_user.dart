import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_watch_application_bloc/Data/global.dart';
import 'package:shopping_watch_application_bloc/Model/watch_product_model.dart';
import 'package:shopping_watch_application_bloc/blocs/card_bloc/cart_bloc.dart';
import 'package:shopping_watch_application_bloc/blocs/card_bloc/cart_state.dart';
import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';
import 'package:shopping_watch_application_bloc/views/order_view/order_widget/add_or_remove_order_screen.dart';
import 'package:shopping_watch_application_bloc/views/order_view/order_widget/watch_info_order_screen.dart';

class AmountOfOrderContainer extends StatelessWidget {
  const AmountOfOrderContainer({Key? key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          BlocBuilder<CartBloc, CartState>(builder: (context, state) {
            return SizedBox(
              height: 300,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  for (var watch in listOrderWatch) orderWatch(watch: watch)
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

class orderWatch extends StatelessWidget {
  const orderWatch({Key? key, required this.watch});

  final Watch watch;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100,
                width: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: appColorColdGrey),
                child: Image.asset(
                  watch.picture,
                  height: 70,
                  width: 70,
                ),
              ),
              WatchInfoOrderScreen(
                watch: watch,
              ),
              AddOrRemoveOrderScreen(
                watch: watch,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
