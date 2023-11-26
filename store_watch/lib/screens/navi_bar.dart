// ignore_for_file: library_private_types_in_public_api

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_watch/blocs/bloc_Auth/bloc/nav_bloc.dart';
import 'package:store_watch/screens/home_screen.dart';
import 'package:store_watch/screens/order_screen.dart';
import 'package:store_watch/screens/profile_screen.dart';

import 'search_screen.dart';

class NaviBar extends StatelessWidget {
  const NaviBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBloc, NavState>(
      builder: (context, state) {
          final pages = [const Home(), SearchScreen(), const OrderScreen(), Profile()];
          int currentIndex = state is NavInitialState ? state.indexPage : 0;
        return Scaffold(
          extendBody: true,
          body: pages[currentIndex], //state
          bottomNavigationBar: DotNavigationBar(
            marginR: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            curve: Curves.fastLinearToSlowEaseIn,
            backgroundColor: Colors.orange[200],
            currentIndex: currentIndex,
            onTap: (index) {
              context.read<NavBloc>().add(ClickNavEvent(clickIndex: index));
            },
            dotIndicatorColor: const Color(0xff233b67),
            items: [
              DotNavigationBarItem(
                  icon: const Icon(Icons.home_outlined),
                  selectedColor: const Color(0xff233b67),
                  unselectedColor: const Color(0xff233b67)),
              DotNavigationBarItem(
                  icon: const Icon(Icons.search),
                  selectedColor: const Color(0xff233b67),
                  unselectedColor: const Color(0xff233b67)),
              DotNavigationBarItem(
                  icon: const Icon(Icons.shopping_bag_outlined),
                  selectedColor: const Color(0xff233b67),
                  unselectedColor: const Color(0xff233b67)),
              DotNavigationBarItem(
                  icon: const Icon(Icons.person_outline),
                  selectedColor: const Color(0xff233b67),
                  unselectedColor: const Color(0xff233b67)),
            ],
          ),
        );
      },
    );
  }
}
