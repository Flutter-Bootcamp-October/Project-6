import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/blocs/bloc_card_shop/card_shop_bloc.dart';
import 'package:shopping_app/consts/colors.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/screens/home_screen.dart';
import 'package:shopping_app/screens/profile_screen.dart';
import 'package:shopping_app/screens/search_screen.dart';

// ignore: must_be_immutable
class AppBottomNavBar extends StatelessWidget {
  AppBottomNavBar({Key? key, required this.product}) : super(key: key);

  final Product product;
  int selected = 0;

  late final List<Widget> screensList = [
    HomeScreen(),
    SearchScreen(
      product: product,
    ),
    HomeScreen(),
    ProfileScreen(product: product),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardShopBloc, CardShopState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          bottomNavigationBar: DotNavigationBar(
            currentIndex: selected,
            onTap: (index) {
              selected = index;
              context.read<CardShopBloc>().add(OnlyUpdate(product));
            },
            borderRadius: 20,
            backgroundColor: appYellow,
            dotIndicatorColor: appBlue,
            selectedItemColor: appBlue,
            items: [
              DotNavigationBarItem(icon: const Icon(Icons.home_filled)),
              DotNavigationBarItem(icon: const Icon(Icons.search)),
              DotNavigationBarItem(
                  icon: const Icon(Icons.shopping_bag_outlined)),
              DotNavigationBarItem(
                  icon: const Icon(Icons.person_outline_rounded)),
            ],
          ),
          body: screensList[selected],
        );
      },
    );
  }
}
