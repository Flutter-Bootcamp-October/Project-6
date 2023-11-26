import 'package:flutter/material.dart';
import 'package:store_watch/models/product.dart';

class ProdectWidget extends StatelessWidget {
  const ProdectWidget({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 350,
        width: 250,
        child: Stack(children: [
          Container(
            height: 320,
            width: 250,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment(0, 0),
                    end: Alignment(1, 1),
                    colors: [
                      Colors.transparent,
                      Color.fromARGB(80, 255, 255, 255),
                    ]),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Center(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Image.asset(
                    product.image,
                    cacheHeight: 200,
                    cacheWidth: 150,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    product.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xff233b67)),
                  ),
                ),
                Text('\$ ${product.price}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            )),
          ),
          Positioned(
            left: 95,
            top: 300,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.orange[200]),
              child: const Icon(
                Icons.add,
                size: 30,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
