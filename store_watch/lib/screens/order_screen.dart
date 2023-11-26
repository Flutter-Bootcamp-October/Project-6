import 'package:flutter/material.dart';
import 'package:store_watch/data/global.dart';
import 'package:store_watch/screens/checkout_screen.dart';
import 'package:store_watch/widgets/display_order.dart';
import 'package:store_watch/widgets/two_text.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => OrderScreenState();
}

class OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    calculateGlobalPric();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('My Orders'),
        centerTitle: true,
        actions: const [Icon(Icons.shopping_bag_outlined)],
      ),
      body: Column(
        children: [
          const DisplayOrder(),
          const Spacer(),
          TwoText(
              leftText: 'Total Price',
              rightText: '\$ ${globalPrice.toStringAsFixed(2)}'),
          TwoText(
              leftText: 'Discount',
              rightText: '\$ ${((globalPrice * 0.08)).toStringAsFixed(2)}'),
          TwoText(
            leftText: 'Delivery Free',
            rightText: 'Free',
            color: Colors.green[300],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: Colors.black,
            ),
          ),
          TwoText(
            leftText: 'Grand Total',
            rightText:
                '\$ ${(globalPrice - (globalPrice * 0.08)).toStringAsFixed(2)}',
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CheckoutScreen(),
              ));
            },
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(20), right: Radius.circular(20)),
              ),
              backgroundColor: Colors.orange[200],
              fixedSize: Size(MediaQuery.of(context).size.width * 0.9, 1),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_bag_outlined,
                  color: Color(0xff233b67),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Add to Cart',
                  style: TextStyle(color: Color(0xff233b67)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
