import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wach_store_app/BLoCs/cart_bloc/cart_bloc.dart';
import 'package:wach_store_app/BLoCs/cart_bloc/cart_event.dart';
import 'package:wach_store_app/models/wach_model.dart';
import 'package:wach_store_app/screens/products_details.dart';

// ignore: must_be_immutable
class ItemCard extends StatelessWidget {
  ItemCard({super.key, required this.watch});

  WatchProduct watch;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(wach: watch)));
        watch.count = 1;
      },
      child: Container(
        height: 380,
        width: 210,
        child: Stack(
          children: [
            Positioned(
              top: 130,
              child: Image.asset('lib/assets/images/product-card.png'),
            ),
            Positioned(
              left: -32,
              child: Image.asset(
                watch.image,
                height: 250,
                width: 250,
              ),
            ),
            Positioned(
              top: 270,
              left: 24,
              child: Text(
                watch.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Color(0xff163368),
                ),
              ),
            ),
            Positioned(
              top: 300,
              left: 62,
              child: Text(
                '\$${watch.price}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Positioned(
              top: 331,
              left: 78,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Color(0xfffcc972), shape: BoxShape.circle),
                child: InkWell(
                  onTap: () {
                    context
                        .read<CartBloc>()
                        .add(AddWatchFromHomeEvent(watch: watch));
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
