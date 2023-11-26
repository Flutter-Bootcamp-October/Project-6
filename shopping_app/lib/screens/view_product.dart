import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/bloc/counter_bloc/counter_bloc.dart';
import 'package:shopping_app/bloc/counter_bloc/counter_event.dart';
import 'package:shopping_app/bloc/counter_bloc/counter_state.dart';
import 'package:shopping_app/consts/colors.dart';
import 'package:shopping_app/global/global.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/screens/my_order_screen.dart';
import 'package:shopping_app/widgets/button_widget.dart';
import 'package:shopping_app/widgets/my_app_bar.dart';

class ViewProfuct extends StatelessWidget {
  const ViewProfuct({super.key, required this.prodect});
  final Product prodect;

  @override
  Widget build(BuildContext context) {
    int count = 1;
    return Scaffold(
      appBar: MyAppBar(
          leadingIcon: Icons.arrow_back_ios_new_rounded,
          title: prodect.name,
          actionIcon: Icons.shopping_bag_outlined),
      body: ListView(
        children: [
          Center(child: Image.asset(prodect.image)),
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
                      prodect.name,
                      style: const TextStyle(
                          color: appBlue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "\$${(prodect.price).toStringAsFixed(2)}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(children: [
                  InkWell(
                    onTap: () {
                      context.read<CounterBloc>().add(IncreaseEvent(count));
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
                    child: BlocConsumer<CounterBloc, CounterState>(
                      listener: (context, state) {
                        state is ChangeCounterState
                            ? count = state.newCounter
                            : count = count;
                      },
                      builder: (context, state) {
                        return Text(
                          state is ChangeCounterState
                              ? "${state.newCounter}"
                              : "$count",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        );
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.read<CounterBloc>().add(DecreaseEvent(count));
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
            prodect.count += count;
            if (!currentUser.cart.contains(prodect)) {
              currentUser.cart.add(prodect);
            } else {
              for (var prodect in currentUser.cart) {
                if (prodect == prodect) {
                  prodect.count = prodect.count;
                }
              }
            }
            count = 1;
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const MyOrderScreen();
            }));
          },
          radius: 20),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
