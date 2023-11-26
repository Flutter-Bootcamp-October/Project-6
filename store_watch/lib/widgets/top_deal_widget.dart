import 'package:flutter/material.dart';
import 'package:store_watch/models/product.dart';


class TopDealsWidget extends StatelessWidget {
  const TopDealsWidget({
    super.key,
    required this.product,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Container(
        height: 200,
        width: 350,
        decoration: const BoxDecoration(
            color: Color(0xff233b67),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              product.name,
              style: const TextStyle(
                  fontFamily: 'Lora', color: Colors.white, fontSize: 26),
            ),
            Image.asset(
              product.image,
              cacheHeight: 200,
              cacheWidth: 150,
              fit: BoxFit.contain,
            )
          ],
        ),
      ),
    );
  }
}
