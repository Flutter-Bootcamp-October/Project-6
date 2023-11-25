import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wach_store_app/blocs/bloc_cart/cart_bloc.dart';
import 'package:wach_store_app/blocs/bloc_cart/cart_state.dart';
import 'package:wach_store_app/models/wach_model.dart';
import 'package:wach_store_app/widgets/cart_widgets/column_circle_button_widget.dart';

class CartProdectWidget extends StatefulWidget {
  const CartProdectWidget({super.key, required this.watch});
  final WatchProduct watch;
  @override
  State<CartProdectWidget> createState() => _CartProdectWidgetState();
}

class _CartProdectWidgetState extends State<CartProdectWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                'lib/assets/images/backgraund.jpg',
                width: 120,
                height: 120,
              ),
              Image.asset(
                widget.watch.image,
                width: 100,
                height: 100,
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.watch.name,
                  style: const TextStyle(
                      color: Color(0xff163368),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Crimson'),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.watch.description,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${widget.watch.price}',
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Crimson'),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return ColumnCircleButton(
                product: widget.watch,
              );
            },
          ),
        ],
      ),
    );
  }
}
