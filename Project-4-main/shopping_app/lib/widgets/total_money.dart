import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/bloc/cart_bloc/cart_bloc.dart';

class TotalMoney extends StatelessWidget {
  const TotalMoney({super.key});

  @override
  Widget build(BuildContext context) {
    double itemTotal = 0;
    double discount = 0;
    double groundTotal = 0;
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartInitial) {
          itemTotal = state.total;
          discount = state.discount;
          groundTotal = state.ground;
        } else if (state is UpdateCartState) {
          itemTotal = state.total;
          discount = state.discount;
          groundTotal = state.ground;
        }
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Item total"),
                Text('\$${itemTotal.toStringAsFixed(2)}')
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Discount"),
                  Text("-\$${discount.toStringAsFixed(2)}",
                      style: const TextStyle(color: Colors.red))
                ],
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Delivary free", style: TextStyle(color: Colors.green)),
                Text("Free", style: TextStyle(color: Colors.green))
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Ground total"),
                Text("\$${groundTotal.toStringAsFixed(2)}")
              ],
            ),
          ],
        );
      },
    );
  }
}
