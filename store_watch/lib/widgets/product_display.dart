import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_watch/blocs/bloc_Auth/bloc/bloc/display_detail_bloc.dart';
import 'package:store_watch/models/product.dart';
import 'package:store_watch/widgets/product_widget.dart';

class ProductDisplay extends StatelessWidget {
  final List<Product> products;
  const ProductDisplay({
    super.key,
    required this.products,
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
        children: products
            .map((item) => GestureDetector(
                  onTap: () {
                    context
                        .read<DisplayDetailBloc>()
                        .add(ProductDetailDisplayEvent(product: item));
                  },
                  child: ProdectWidget(
                    product: item,
                  ),
                ))
            .toList(),
      ),
    );
  }
}
