import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc/models/product.dart';

import '../blocs/cart_bloc/bloc/cart_bloc.dart';

class OrderAddRemove extends StatelessWidget {
  const OrderAddRemove({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.orange[200],
            shape: BoxShape.circle,
          ),
          child: InkWell(
            onTap: () {
              context.read<CartBloc>().add(DecreaseDeleteEvent(product));
            },
            child: const Icon(
              Icons.remove,
            ),
          ),
        ),
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is DeleteCartState) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  product.count.toString(),
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                product.count.toString(),
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            );
          },
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.orange[200],
          ),
          child: InkWell(
            onTap: () {
              context.read<CartBloc>().add(IncreaseEvent(product));
            },
            child: const Icon(
              Icons.add,
            ),
          ),
        )
      ],
    );
  }
}
