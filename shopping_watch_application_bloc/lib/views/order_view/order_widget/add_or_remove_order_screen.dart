import 'package:flutter/material.dart';
import 'package:shopping_watch_application_bloc/Model/watch_product_model.dart';
import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';

class AddOrRemoveOrderScreen extends StatelessWidget {
  const AddOrRemoveOrderScreen({super.key, required this.watch});

    final Watch watch;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: const BoxDecoration(
              color: appColorYellow, shape: BoxShape.circle),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.remove,
                size: 15,
                color: appColorBlue,
              )),
        ),
        height10,
        const Text("1"),
        height10,
        Container(
          height: 30,
          width: 30,
          decoration: const BoxDecoration(
              color: appColorYellow, shape: BoxShape.circle),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                size: 15,
                color: appColorBlue,
              )),
        ),
      ],
    );
  }
}
