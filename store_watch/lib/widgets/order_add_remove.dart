import 'package:flutter/material.dart';
import 'package:store_watch/data/global.dart';
import 'package:store_watch/models/product.dart';
import 'package:store_watch/screens/order_screen.dart';
import 'package:store_watch/widgets/display_order.dart';

class OrderAddRemove extends StatefulWidget {
  const OrderAddRemove({super.key, required this.product});
  final Product product;

  @override
  State<OrderAddRemove> createState() => _OrderAddRemoveState();
}

class _OrderAddRemoveState extends State<OrderAddRemove> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.orange[200],
            shape: BoxShape.circle,
          ),
          child: InkWell(
            onTap: () {
              if (widget.product.count! > 1) {
                widget.product.count = widget.product.count! - 1;
                globalPrice -= double.parse(widget.product.price);

                setState(() {});
                context
                    .findAncestorStateOfType<OrderScreenState>()!
                    .setState(() {});
              } else if (widget.product.count! == 1) {
                widget.product.count = 0;
                globalPrice = globalPrice -
                    (double.parse(widget.product.price) *
                        widget.product.count!);
                orderProducts.remove(widget.product);
                setState(() {});

                context
                    .findAncestorStateOfType<OrderScreenState>()!
                    .setState(() {});
                context
                    .findAncestorStateOfType<DisplayOrderState>()!
                    .setState(() {});
              }
            },
            child: const Icon(
              Icons.remove,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            widget.product.count.toString(),
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.orange[200],
          ),
          child: InkWell(
            onTap: () {
              widget.product.count = widget.product.count! + 1;
              globalPrice += double.parse(widget.product.price);
              setState(() {});

              context
                  .findAncestorStateOfType<OrderScreenState>()!
                  .setState(() {});
            },
            child: const Icon(
              Icons.add,
            ),
          ),
        )
      ],
    );
  }
}
