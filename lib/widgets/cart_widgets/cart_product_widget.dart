import 'package:flutter/material.dart';
import 'package:wach_store_app/models/wach_model.dart';
import 'package:wach_store_app/widgets/cart_widgets/column_circle_button_widget.dart';

class CartProdectWidget extends StatelessWidget {
  const CartProdectWidget({super.key, required this.watch});
  final WatchProduct watch;
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
                watch.image,
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
                  watch.name,
                  style: const TextStyle(
                      color: Color(0xff163368),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Crimson'),
                ),
                const SizedBox(height: 8),
                Text(
                  watch.description,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${watch.price}',
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Crimson'),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          ColumnCircleButton(
            watch: watch,
          ),
        ],
      ),
    );
  }
}
