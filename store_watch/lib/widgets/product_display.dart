import 'package:flutter/material.dart';
import 'package:store_watch/data/global.dart';
import 'package:store_watch/widgets/product_widget.dart';

class ProductDisplay extends StatelessWidget {
  const ProductDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: MediaQuery.of(context).size.width,
      child: GridView.count(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        crossAxisCount: 1,
        childAspectRatio: 1.5,
        children: listProduct
            .map((item) => ProdectWidget(
                  product: item,
                ))
            .toList(),
      ),
    );
  }
}
