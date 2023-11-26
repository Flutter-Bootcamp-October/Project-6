import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/blocs/bloc_card_shop/card_shop_bloc.dart';
import 'package:shopping_app/consts/colors.dart';
import 'package:shopping_app/data/global.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/screens/my_order_screen.dart';
import 'package:shopping_app/widgets/button_widget.dart';
import 'package:shopping_app/widgets/my_app_bar.dart';

class ViewProfuct extends StatelessWidget {
  ViewProfuct({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
          leadingIcon: Icons.arrow_back_ios_new_rounded,
          title: product.name,
          actionIcon: Icons.shopping_bag_outlined),
      body: BlocBuilder<CardShopBloc, CardShopState>(
        builder: (context, state) {
          return ListView(
            children: [
              Center(child: Image.asset(product.image)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(
                              color: appBlue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "\$${(getItemTotal(product)).toStringAsFixed(2)}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(children: [
                      InkWell(
                        onTap: () {
                          context
                              .read<CardShopBloc>()
                              .add(IncreaseTheCounter(product));
                        },
                        child: ClipOval(
                          child: Container(
                            width: 30,
                            height: 30,
                            color: appYellow,
                            child: const Icon(Icons.add),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "${(product.count)}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          context
                              .read<CardShopBloc>()
                              .add(DecreaseTheCounter(product));
                        },
                        child: ClipOval(
                          child: Container(
                            width: 30,
                            height: 30,
                            color: appYellow,
                            child: const Icon(Icons.remove),
                          ),
                        ),
                      )
                    ])
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  product.description,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  "Rating",
                  style: TextStyle(
                      color: appBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  const SizedBox(width: 8),
                  Icon(Icons.star_rounded,
                      color:
                          product.rating >= 1.0 ? Colors.amber : Colors.grey),
                  Icon(Icons.star_rounded,
                      color:
                          product.rating >= 2.0 ? Colors.amber : Colors.grey),
                  Icon(Icons.star_rounded,
                      color:
                          product.rating >= 3.0 ? Colors.amber : Colors.grey),
                  Icon(Icons.star_rounded,
                      color:
                          product.rating >= 4.0 ? Colors.amber : Colors.grey),
                  Icon(Icons.star_rounded,
                      color: product.rating == 5.0 ? Colors.amber : Colors.grey)
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0, left: 16),
                child: Text(
                  "Discount",
                  style: TextStyle(
                      color: appBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text("${(product.discount * 100).toStringAsFixed(0)}%"),
              )
            ],
          );
        },
      ),
      floatingActionButton: ButtonCustom(
          buttonColor: appYellow,
          buttonChild: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black,
              ),
              Text(
                "Add to cart",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
          onPressed: () {
            if (!currentUser.cart.contains(product)) {
              BlocProvider.of<CardShopBloc>(context).add(AddToCart(product));
            }
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MyOrderScreen(
                product: product,
              );
            }));
          },
          radius: 20),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
