import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/data/global_data.dart';
import 'package:project_4/models/watch_model.dart';
import 'package:project_4/widgets/circle_icon.dart';
import '../../../bloc/cart_bloc/cart_bloc.dart';
import 'product_background_widget.dart';

class DetailsPageMainWidget extends StatelessWidget {
  const DetailsPageMainWidget({
    super.key,
    required this.watch,
  });

  final Watch watch;

  @override
  Widget build(BuildContext context) {
    // int counter = 1;
    return Column(
      children: [
        ProductBackgroundWidget(
          watch: watch,
        ),
        Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            watch.name,
                            style: const TextStyle(
                                fontSize: 24, color: Color(0xff294475), fontFamily: 'DMSerifText'),
                          ),
                          Text(
                            "₹${watch.price}",
                            style: const TextStyle(fontSize: 24, fontFamily: 'DMSerifText'),
                          ),
                        ],
                      ),
                      const Spacer(),
                      BlocBuilder<CartBloc, CartState>(
                        builder: (context, state) {
                          return Row(
                            children: [
                              CircleIcon(
                                  iconData: Icons.remove,
                                  onPressedFunc: () {
                                    context
                                        .read<CartBloc>()
                                        .add(CartDecreaseCountEvent(watch: watchesList.last));
                                  }),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                //quantity
                                "${state.counter}",
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              CircleIcon(
                                  iconData: Icons.add,
                                  onPressedFunc: () {
                                    context
                                        .read<CartBloc>()
                                        .add(CartIncreaseCountEvent(watch: watchesList.last));
                                  }),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    watch.description,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
