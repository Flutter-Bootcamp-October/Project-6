import 'package:flutter/material.dart';
import 'package:project_6/models/watch_model.dart';
import 'package:project_6/screens/ProductDetailsPage/product_details_screen.dart';
import 'package:project_6/widgets/circle_icon.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.watch,
  });

  final Watch watch;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //move to product details
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(watch: watch),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            width: 225,
            height: 350,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.elliptical(25, 55),
                    topLeft: Radius.elliptical(300, 550),
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35)),
                color: Color(0xfff9f8f8)),
          ),
          Positioned(
              left: 45,
              child: Image.asset(
                watch.image,
                width: 150,
              )),
          Positioned(
            top: 265,
            left: 55,
            child: Column(
              children: [
                Text(
                  watch.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text(
                  '₹${watch.price}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          Positioned(
              top: 300,
              left: 95,
              child: InkWell(
                  //add to cart button
                  onTap: () {},
                  child:
                      CircleIcon(iconData: Icons.add, onPressedFunc: () {}))),
        ],
      ),
    );
  }
}
