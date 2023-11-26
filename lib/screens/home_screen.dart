import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/blocs/bloc_card_shop/card_shop_bloc.dart';
import 'package:shopping_app/consts/colors.dart';
import 'package:shopping_app/data/data.dart';
import 'package:shopping_app/data/global.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/widgets/show_watch.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    productList.clear();
    for (Map product in watchesdata) {
      productList.add(Product.fromJson(product));
    }

    return BlocBuilder<CardShopBloc, CardShopState>(
      builder: (context, state) {
        return DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: const Icon(Icons.menu_rounded, color: Colors.black),
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.watch_rounded, color: appBlue),
                  Text(
                    "ADS Watch",
                    style: TextStyle(color: appBlue),
                  )
                ],
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.filter_list_rounded,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 8)
              ],
            ),
            body: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 16, left: 16),
                  child: Text(
                    "Hello",
                    style: TextStyle(
                        color: appBlue,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16, bottom: 32),
                  child: Text(
                    "Chose your top Brands",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                TabBar(
                  padding: const EdgeInsets.all(8),
                  labelPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  isScrollable: true,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicator: BoxDecoration(
                      color: appYellow,
                      borderRadius: BorderRadius.circular(16)),
                  tabs: const [
                    Text("Trending"),
                    Text("Popular"),
                    Text("New"),
                    Text("BestCollection"),
                  ],
                ),
                SizedBox(
                  height: 330,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productList.length,
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        return ShowWatch(product: productList[index]);
                      }),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Top deals",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(
                        "See All",
                        style: TextStyle(color: appBlue),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset("assets/images/ad.jpg")),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
