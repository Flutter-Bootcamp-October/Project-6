import 'package:flutter/material.dart';
import 'package:shopingpriject/data/global.dart';
import 'package:shopingpriject/wedgets/proudct_widget.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listProucts.length,
        itemBuilder: (context, index) {
          return ProductWidget(
            product: listProucts[index],
          );
        },
      ),
    );
  }
}
