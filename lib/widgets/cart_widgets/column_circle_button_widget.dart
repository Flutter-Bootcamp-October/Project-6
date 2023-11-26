import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wach_store_app/BLoCs/cart_bloc/cart_bloc.dart';
import 'package:wach_store_app/BLoCs/cart_bloc/cart_event.dart';
import 'package:wach_store_app/BLoCs/cart_bloc/cart_state.dart';
import 'package:wach_store_app/models/wach_model.dart';

// ignore: must_be_immutable
class ColumnCircleButton extends StatelessWidget {
  ColumnCircleButton({super.key, required this.watch});
  WatchProduct watch;
  @override
  Widget build(BuildContext context) {
    return Column(
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
              // if (widget.watch.count! > 1) {
              //   widget.watch.count = widget.watch.count! - 1;
              //   globalPrice -= double.parse(widget.watch.price!);

              //   setState(() {});
              //   context
              //       .findAncestorStateOfType<CartScreenState>()!
              //       .setState(() {});
              // } else if (widget.watch.count! == 1) {
              //   widget.watch.count = 0;
              //   globalPrice = globalPrice -
              //       (double.parse(widget.watch.price!) * widget.watch.count!);
              //   orderProducts.remove(widget.watch);
              //   context
              //       .findAncestorStateOfType<CartScreenState>()!
              //       .setState(() {});
              // }
              context.read<CartBloc>().add(DecrementWatchEvent(watch: watch));
            },
          ),
        ),
        const SizedBox(
          height: 8,
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
          height: 8,
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
