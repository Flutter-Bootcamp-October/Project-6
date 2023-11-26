import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/blocs/product_bloc/product_bloc.dart';
import 'package:watch_store/models/product.dart';
import 'package:watch_store/screens/main_app_screens/cart_screen.dart';
import 'package:watch_store/styles/custom_colors.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,

        title: Center(
          child: Text(
            product.name,
            style: TextStyle(color: black),
          ),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartScreen()));
            },
            child: Icon(
              Icons.shopping_bag_outlined,
              color: black,
            ),
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: ListView(children: [
        SizedBox(width: 500, height: 400, child: Image.asset(product.image)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(fontSize: 20, color: secondary),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      ("\$ ${product.price}"),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        context
                            .read<ProductBloc>()
                            .add(IncreaceProductEvent(product));
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primary,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    BlocBuilder<ProductBloc, ProductState>(
                      builder: (context, state) {
                        return Text(
                          product.count.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        );
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        context
                            .read<ProductBloc>()
                            .add(DecreceProductEvent(product));
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primary,
                        ),
                        child: const Icon(
                          Icons.remove,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18),
              child: Text(
                product.description,
                style: const TextStyle(
                    color: Color.fromARGB(255, 126, 126, 126), fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            InkWell(
              onTap: () {
                context.read<ProductBloc>().add(AddProductEvent(product));
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: primary),
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_bag_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Add to Cart',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}
