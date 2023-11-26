import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/blocs/bloc_card_shop/card_shop_bloc.dart';
import 'package:shopping_app/data/global.dart';

class TotalMoney extends StatelessWidget {
  const TotalMoney({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardShopBloc, CardShopState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Item total"),
                Text('\$${getTotal().toStringAsFixed(2)}')
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Delivery free", style: TextStyle(color: Colors.green)),
                Text("Free", style: TextStyle(color: Colors.green))
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Ground total"),
                Text("\$${getTotal().toStringAsFixed(2)}")
              ],
            ),
          ],
        );
      },
    );
  }
}
