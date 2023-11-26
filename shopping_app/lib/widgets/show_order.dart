import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/bloc/counter_bloc/counter_bloc.dart';
import 'package:shopping_app/bloc/counter_bloc/counter_event.dart';
import 'package:shopping_app/bloc/counter_bloc/counter_state.dart';
import 'package:shopping_app/consts/colors.dart';
import 'package:shopping_app/models/product_model.dart';

class ShowOrder extends StatelessWidget {
  const ShowOrder({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          child: Image.asset(product.image),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Text(
              product.name,
              style: const TextStyle(
                  color: appBlue, fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(
              width: 165,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  product.description,
                  style: const TextStyle(color: Colors.grey, fontSize: 10),
                ),
              ),
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  "\$${(product.price * product.count).toStringAsFixed(2)}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                );
              },
            )
          ],
        ),
        const SizedBox(width: 32),
        Column(
          children: [
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                context.read<CounterBloc>().add(IncreaseCartEvent(product));
              },
              child: ClipOval(
                child: Container(
                  width: 30,
                  height: 30,
                  color: appYellow,
                  child: const Icon(Icons.add),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return Text(
                    "${product.count}",
                    style: const TextStyle(fontSize: 20),
                  );
                },
              ),
            ),
            InkWell(
              onTap: () {
                context.read<CounterBloc>().add(DecreaseCartEvent(product));
              },
              child: ClipOval(
                child: Container(
                  width: 30,
                  height: 30,
                  color: appYellow,
                  child: const Icon(Icons.remove),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
