import 'package:flutter/material.dart';
import 'package:wach_store_app/models/wach_model.dart';

class FeaturedProductCard extends StatelessWidget {
  FeaturedProductCard({
    super.key,
    required this.watch,
  });

  WatchProduct watch;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      width: 170,
      child: Stack(
        children: [
          Positioned(
            top: 130,
            child: Image.asset(
              'lib/assets/images/card.png',
              height: 200,
              width: 200,
            ),
          ),
          Positioned(
            top: 32,
            left: 0,
            child: Image.asset(
              watch.image,
              height: 200,
              width: 200,
            ),
          ),
          Positioned(
            top: 240,
            left: 48,
            child: Text(
              watch.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Colors.blue[900],
              ),
            ),
          ),
          Positioned(
            top: 260,
            left: 70,
            child: Text(
              '\$${watch.price}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
