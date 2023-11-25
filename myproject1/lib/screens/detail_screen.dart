import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopingpriject/blocs/bloc/bloc5/bloc/detail_bloc.dart';
import 'package:shopingpriject/blocs/bloc/bloc5/bloc/detail_event.dart';
import 'package:shopingpriject/blocs/bloc/bloc5/bloc/detail_state.dart';

import 'package:shopingpriject/extenstions/navigator.dart';
import 'package:shopingpriject/models/product_model.dart';
import 'package:shopingpriject/screens/order_screen.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailBloc(),
      child: BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          if (state is ProductAddedState) {
            context.pushScreen(OrderScreen());
          } else if (state is DetailErrorState) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Error'),
                  content: Text(state.errorMessage),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
          }

          return Scaffold(
            body: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back_ios),
                      Text(
                        product.name,
                        style: TextStyle(fontSize: 20),
                      ),
                      Icon(Icons.shopping_bag_outlined)
                    ],
                  ),
                ),
                Container(
                  width: 300,
                  height: 450,
                  color: Color(0XFFf9f7f8),
                  child: Image.asset(
                    product.image,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.name,
                        style:
                            TextStyle(fontSize: 25, color: Color(0xff20395a)),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        color: Color(0xfffcc874),
                      ),
                      child: Icon(Icons.remove),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "1",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        color: Color(0xfffcc874),
                      ),
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 280),
                  child: Text(
                    product.price.toString(),
                    style: TextStyle(fontSize: 25, color: Color(0xff20395a)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product.description,
                    style: TextStyle(fontSize: 20, color: Color(0xff868485)),
                  ),
                ),
                Container(
                  width: 350.0,
                  height: 52.0,
                  child: FloatingActionButton(
                    elevation: 0,
                    backgroundColor: Color(0xfffcc874),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {
                      print('Add to Cart pressed');
                      context.read<DetailBloc>().add(AddToCartEvent(product));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.black,
                          size: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(color: Colors.black, fontSize: 17),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
