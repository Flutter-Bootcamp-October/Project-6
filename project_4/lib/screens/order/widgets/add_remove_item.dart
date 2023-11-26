import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/bloc/cart_bloc/cart_bloc.dart';
import 'package:project_4/models/watch_model.dart';
import 'package:project_4/widgets/circle_icon.dart';

class AddRemoveItem extends StatelessWidget {
  const AddRemoveItem({
    super.key,
    this.price,
    required this.watch,
  });

  final double? price;
  final Watch watch;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleIcon(
            iconData: Icons.remove,
            onPressedFunc: () {
              context.read<CartBloc>().add(CartDecreaseEvent(watch: watch));
            }),
        Text(
          "${watch.count}",
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        CircleIcon(
            iconData: Icons.add,
            onPressedFunc: () {
              context.read<CartBloc>().add(CartIncreaseEvent(watch: watch));
            }),
      ],
    );
  }
}
