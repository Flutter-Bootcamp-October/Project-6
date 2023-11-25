import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/bloc/cart_bloc/cart_bloc.dart';
import 'package:shopping_app/bloc/product_bloc/product_bloc.dart';
import 'package:shopping_app/consts/colors.dart';
import 'package:shopping_app/extentions/navigation_extentions.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/screens/my_order_screen.dart';
import 'package:shopping_app/widgets/button_widget.dart';

class ViewProduct extends StatelessWidget {
  const ViewProduct({super.key, required this.prodect});
  final Product prodect;

  @override
  Widget build(BuildContext context) {
    int count = 1;
    return Scaffold(
      appBar: AppBar(title: Text(prodect.name), actions: [
        IconButton(
            onPressed: () {
              context.read<CartBloc>().add(ViewCartEvent());
              context.pushScreen(const MyOrderScreen());
            },
            icon: const Icon(Icons.shopping_bag_outlined))
      ]),
      body: ListView(
        children: [
          Center(child: Image.asset(prodect.image)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                count = state is UpdateCountState ? state.count : count;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          prodect.name,
                          style: const TextStyle(
                              color: appBlue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "\$${(prodect.price * count).toStringAsFixed(2)}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(children: [
                      InkWell(
                        onTap: () {
                          context
                              .read<ProductBloc>()
                              .add(DecreamentCountEvent(count: count));
                        },
                        child: ClipOval(
                          child: Container(
                            width: 30,
                            height: 30,
                            color: appYellow,
                            child: const Icon(Icons.remove),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "$count",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          context
                              .read<ProductBloc>()
                              .add(IncreamentCountEvent(count: count));
                        },
                        child: ClipOval(
                          child: Container(
                            width: 30,
                            height: 30,
                            color: appYellow,
                            child: const Icon(Icons.add),
                          ),
                        ),
                      )
                    ])
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              prodect.description,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              "Rating",
              style: TextStyle(
                  color: appBlue, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 8),
              Icon(Icons.star_rounded,
                  color: prodect.rating >= 1.0 ? Colors.amber : Colors.grey),
              Icon(Icons.star_rounded,
                  color: prodect.rating >= 2.0 ? Colors.amber : Colors.grey),
              Icon(Icons.star_rounded,
                  color: prodect.rating >= 3.0 ? Colors.amber : Colors.grey),
              Icon(Icons.star_rounded,
                  color: prodect.rating >= 4.0 ? Colors.amber : Colors.grey),
              Icon(Icons.star_rounded,
                  color: prodect.rating == 5.0 ? Colors.amber : Colors.grey)
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0, left: 16),
            child: Text(
              "Discount",
              style: TextStyle(
                  color: appBlue, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text("${(prodect.discount * 100).toStringAsFixed(0)}%"),
          )
        ],
      ),
      floatingActionButton: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          if (state is AddedTocartsucessState) {
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('${prodect.name} was added to your cart!'),
                );
              },
            );
          }
        },
        child: ButtonCustom(
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
              context
                  .read<CartBloc>()
                  .add(AddToCartEvent(count: count, product: prodect));
            },
            radius: 20),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
