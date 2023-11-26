import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopping_watch_application_bloc/Model/watch_product_model.dart';
import 'package:shopping_watch_application_bloc/blocs/card_bloc/cart_bloc.dart';
import 'package:shopping_watch_application_bloc/blocs/card_bloc/cart_event.dart';
import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';

class DispalyAllWatch extends StatelessWidget {
  const DispalyAllWatch({super.key, required this.watch});
  final Watch watch;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return WatchInfoScreen(
        //     watch: watch,
        //   );
        // }));
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 300,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: appColorWhite),
          ),
          Positioned(
            top: 153,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 130,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: appColorColdGrey),
            ),
          ),
          SizedBox(
            height: 300,
            width: 230,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  watch.picture,
                  height: 170,
                  width: 100,
                ),
                Text(
                  watch.name,
                  style: const TextStyle(
                      fontSize: 15,
                      color: appColorBlue,
                      fontFamily: "PlayfairDisplay",
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$ ${watch.price.toString()}',
                  style: const TextStyle(
                      fontSize: 20,
                      fontFamily: "PlayfairDisplay",
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Positioned(
            top: 250,
            left: 95,
            child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    border: Border.all(width: 5, color: appColorWhite),
                    color: appColorYellow,
                    shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {
                    context.read<CartBloc>().add(AddProductEvent(watch));
                  },
                  icon: Icon(Icons.add),
                )),
          )
        ],
      ),
    );
  }
}
