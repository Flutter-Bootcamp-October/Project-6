import 'package:flutter/material.dart';
import 'package:shopping_watch_application_bloc/Model/watch_product_model.dart';
import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';

class WatchInfoOrderScreen extends StatelessWidget {
  const WatchInfoOrderScreen({super.key, required this.watch});
  final Watch watch;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            watch.name,
            style: const TextStyle(
                fontFamily: "PlayfairDisplay",
                color: appColorBlue,
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
          height10,
          Text(
            watch.title,
            style: const TextStyle(
                color: appColorGrey, fontWeight: FontWeight.w500, fontSize: 10),
          ),
          height10,
          Text(
            "\$ ${watch.price}",
            style: const TextStyle(
                fontFamily: "PlayfairDisplay",
                fontWeight: FontWeight.w600,
                fontSize: 18),
          )
        ],
      ),
    );
  }
}
