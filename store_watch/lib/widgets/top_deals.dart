import 'package:flutter/material.dart';
import 'package:store_watch/data/global.dart';
import 'package:store_watch/models/product.dart';
import 'package:store_watch/widgets/top_deal_widget.dart';

class TopDeals extends StatelessWidget {
  final List<Product> products;
  const TopDeals({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: GridView.count(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        crossAxisCount: 1,
        childAspectRatio: 0.5,
        children: products
            .map((item) => TopDealsWidget(
                  product: item,
                ))
            .toList(),
      ),
    );
  }
}
