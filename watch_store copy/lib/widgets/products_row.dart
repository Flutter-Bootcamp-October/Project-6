import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/blocs/product_bloc/product_bloc.dart';
import 'package:watch_store/global/global.dart';
import 'package:watch_store/models/product.dart';
import 'package:watch_store/screens/main_app_screens/details_screen.dart';
import 'package:watch_store/styles/custom_colors.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(right: 250, top: 10, left: 20),
        child: BlocListener<ProductBloc, ProductState>(
          listener: (context, state) {
            if (state is CartUpdatedState) {
              if (state.massege != "") {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.massege)));
              }
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: listProducts
                .map((elemnet) => ProductView(
                      product: elemnet,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

//====================================================
class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreen(
                      product: product,
                    )));
      },
      child: Stack(
        children: [
          SizedBox(
            width: 200,
            height: 400,
            child: SizedBox(
              width: 200,
              height: 400,
              child: Image.asset(product.image),
            ),
          ),
          Positioned(
            left: 45,
            top: 290,
            child: Column(
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                      color: Color(0xff233B67),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "\$ ${product.price}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(
                  height: 17,
                ),
                InkWell(
                  onTap: () {
                    context.read<ProductBloc>().add(AddProductEvent(product));
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: primary,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
