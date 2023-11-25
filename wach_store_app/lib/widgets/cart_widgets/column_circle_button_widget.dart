import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wach_store_app/blocs/bloc_cart/cart_bloc.dart';
import 'package:wach_store_app/blocs/bloc_cart/cart_event.dart';
import 'package:wach_store_app/blocs/bloc_cart/cart_state.dart';
import 'package:wach_store_app/models/wach_model.dart';

class ColumnCircleButton extends StatelessWidget {
  ColumnCircleButton({required this.product});

  final WatchProduct product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Color(0xfffbcf7a),
            borderRadius: BorderRadius.circular(30),
          ),
          child: InkWell(
            child: Icon(Icons.remove),
            onTap: () {
              context.read<CartBloc>().add(DecreseCartEvent(product,product.count!));
            },
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return Text(
              product.count.toString(),
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
            borderRadius: BorderRadius.circular(30),
          ),
          child: InkWell(
            child: const Icon(Icons.add),
            onTap: () {
              BlocProvider.of<CartBloc>(context).add(AddToCartEvent(product,product.count!));
            },
          ),
        )
      ],
    );
  }
}
