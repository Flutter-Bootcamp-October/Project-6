import 'package:flutter/material.dart';
import 'package:store_watch/data/global.dart';
import 'package:store_watch/models/product.dart';
import 'package:store_watch/widgets/order_add_remove.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({super.key, required this.product});

  final Product product;

  @override
  State<OrderWidget> createState() => OrderWidgetState();
}

class OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    calculateGlobalPrice();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 70,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment(0, 0),
                    end: Alignment(1, 1),
                    colors: [
                      Colors.transparent,
                      Color.fromARGB(80, 255, 254, 254),
                    ]),
                borderRadius: BorderRadius.circular(15)),
            child: Image.asset(
              widget.product.image,
              cacheWidth: 100,
              cacheHeight: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.product.name,
                    style: const TextStyle(
                        color: Color(0xff233b67),
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    widget.product.description.substring(0, 37),
                  ),
                ),
                Text(
                  '\$${(double.parse(widget.product.price) * widget.product.count).toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                )
              ],
            ),
          ),
          const Spacer(),
          OrderAddRemove(
            product: widget.product,
          )
        ],
      ),
    );
  }
}
