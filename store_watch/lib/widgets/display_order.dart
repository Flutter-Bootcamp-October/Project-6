import 'package:flutter/material.dart';
import 'package:store_watch/data/global.dart';
import 'package:store_watch/widgets/order_widget.dart';

class DisplayOrder extends StatefulWidget {
  const DisplayOrder({super.key});

  @override
  State<DisplayOrder> createState() => DisplayOrderState();
}

class DisplayOrderState extends State<DisplayOrder> {
  @override
  Widget build(BuildContext context) {
    calculateGlobalPric();
    return SizedBox(
      height: 470,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onLongPress: () {
                orderProducts[index].count = 0;
                globalPrice = globalPrice -
                    (double.parse(orderProducts[index].price) *
                        orderProducts[index].count!);
                orderProducts.remove(orderProducts[index]);

                setState(() {});
              },
              child: OrderWidget(
                product: orderProducts[index],
              ),
            );
          },
          itemCount: orderProducts.length),
    );
  }
}
