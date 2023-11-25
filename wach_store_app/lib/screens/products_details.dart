import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wach_store_app/blocs/bloc_cart/cart_bloc.dart';
import 'package:wach_store_app/blocs/bloc_cart/cart_event.dart';
import 'package:wach_store_app/blocs/bloc_cart/cart_state.dart';
import 'package:wach_store_app/models/wach_model.dart';
import 'package:wach_store_app/screens/my_order_screen.dart';
import 'package:wach_store_app/widgets/appbar/app_bar.dart';
import 'package:wach_store_app/widgets/cart_widgets/row_circle_button_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  final WatchProduct wach;

  ProductDetailsScreen({super.key, required this.wach}) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: appbar(
        context,
        true,
        Icons.shopping_bag_outlined,
        wach.name,
        () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                wach.image,
                width: double.infinity,
                height: 350,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        wach.name,
                        style: const TextStyle(
                          color: Color(0xff163368),
                          fontFamily: 'Crimson',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '\$${wach.price}',
                        style: const TextStyle(
                          fontFamily: 'Crimson',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      return RowCircleButton(watch: wach);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                wach.description,
                style: const TextStyle(
                  fontFamily: 'Crimson',
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyCartScreen() ),
            );
            context.read<CartBloc>().add(AddToCartEvent(wach, wach.count!));
          },
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              color: const Color(0xfffbcf7a),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black,
                ),
                Text(
                  '  Add to Cart',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Crimson',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
