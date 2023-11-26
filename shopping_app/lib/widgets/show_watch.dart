import 'package:flutter/material.dart';
import 'package:shopping_app/consts/colors.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/screens/view_product.dart';

class ShowWatch extends StatelessWidget {
  const ShowWatch({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          const SizedBox(
            width: 200,
            height: 295,
          ),
          Positioned(
            top: 60,
            child: Container(
              width: 200,
              height: 210,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.05),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(product.name,
                      style: const TextStyle(
                          color: appBlue, fontWeight: FontWeight.bold)),
                  Text("\$${product.price}",
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 240,
            left: 70,
            child: ClipOval(
              child: Container(
                width: 60,
                height: 60,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 245,
            left: 75,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewProfuct(prodect: product)));
              },
              child: ClipOval(
                child: Container(
                  width: 50,
                  height: 50,
                  color: appYellow,
                  child: const Center(child: Icon(Icons.add)),
                ),
              ),
            ),
          ),
          SizedBox(width: 200, child: Image.asset(product.image)),
        ],
      ),
    );
  }
}
