import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/blocs/product_bloc/product_bloc.dart';
import 'package:watch_store/global/global.dart';
import 'package:watch_store/models/product.dart';
import 'package:watch_store/screens/main_app_screens/checkout_screen.dart';
import 'package:watch_store/styles/custom_colors.dart';
import 'package:watch_store/widgets/cart_product_viwe.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
        appBar: AppBar(
          elevation: 0,
     
          title: Center(
            child: Text(
              "My Order",
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
            ),
          ),
          actions: [
            Icon(
              Icons.clear,
              color: black,
            ),
            const SizedBox(
              width: 15,
            )
          ],
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            return currentUser.productList.isNotEmpty
                ? SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: currentUser.productList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CartProductViwe(
                                product: currentUser.productList[index]);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 23.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Item Total:",
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                "\$ ${currentUser.total.toString()}",
                                style: const TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 23.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Discount",
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                "\$ 0.0",
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 23.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Deliery Free:",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.green),
                              ),
                              Text(
                                "Free",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.green),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Divider(
                            thickness: 1,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 23.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Grand Total:",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "\$ ${currentUser.total.toString()}",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CheckoutScreen()));
                          },
                          child: Container(
                            height: 50,
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: primary),
                            child: const Center(
                              child: Text(
                                'Checkout',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 120,
                        ),
                      ],
                    ),
                  )
                : const Center(
                    child: Text(
                      "Add your first product !",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  );
          },
        ));
  }
}

class CartProdectsImage extends StatelessWidget {
  const CartProdectsImage({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          height: 140,
          width: 140,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20),
          child: SizedBox(
            width: 100,
            height: 130,
            child: Image.asset(
              "assets/Rectangle 2.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          left: 40,
          top: 10,
          child: SizedBox(
            height: 150,
            width: 70,
            child: Image.asset(product.image),
          ),
        ),
      ],
    );
  }
}
