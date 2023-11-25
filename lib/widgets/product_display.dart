import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc/data/global.dart';
import 'package:project_bloc/widgets/product_widget.dart';
import '../blocs/cart_bloc/bloc/cart_bloc.dart';

class ProductDisplay extends StatelessWidget {
  const ProductDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
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
      },
    );
  }
}
