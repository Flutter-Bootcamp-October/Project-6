import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wach_store_app/BLoCs/cart_bloc/cart_bloc.dart';
import 'package:wach_store_app/BLoCs/cart_bloc/cart_event.dart';
import 'package:wach_store_app/BLoCs/cart_bloc/cart_state.dart';
import 'package:wach_store_app/models/wach_model.dart';

// ignore: must_be_immutable
class RowCircleButton extends StatelessWidget {
  RowCircleButton({super.key, required this.watch});
  WatchProduct watch;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              color: Color(0xfffbcf7a),
              borderRadius: BorderRadius.circular(30)),
          child: InkWell(
            child: Icon(Icons.remove),
            onTap: () {
              context.read<CartBloc>().add(DecrementWatchEvent(watch: watch));
            },
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return Text(
              watch.count.toString(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            );
          },
        ),
        const SizedBox(
          width: 8,
        ),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              color: Color(0xfffbcf7a),
              borderRadius: BorderRadius.circular(30)),
          child: InkWell(
            child: const Icon(
              Icons.add,
            ),
            onTap: () {
              context.read<CartBloc>().add(IncrementWatchEvent(watch: watch));
            },
          ),
        )
      ],
    );
  }
}
