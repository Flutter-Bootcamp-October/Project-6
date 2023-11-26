import 'package:flutter/material.dart';
import 'package:store_watch/data/global.dart';
import 'package:store_watch/widgets/top_deal_widget.dart';

class TopDeals extends StatelessWidget {
  const TopDeals({
    super.key,
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
        children: listProduct
            .map((item) => TopDealsWidget(
                  product: item,
                ))
            .toList(),
      ),
    );
  }
}
