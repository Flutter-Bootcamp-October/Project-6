// ignore_for_file: library_private_types_in_public_api

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc/screens/home_screen.dart';
import 'package:project_bloc/screens/order_screen.dart';
import 'package:project_bloc/screens/profile_screen.dart';

import '../blocs/navi_bloc/navi_bloc.dart';
import 'search_screen.dart';

class NaviBar extends StatelessWidget {
  NaviBar({super.key});

  final List pages = [
    const Home(),
    SearchScreen(),
    const OrderScreen(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NaviBloc, NaviState>(
      builder: (context, state) {
        if (state is PageNaviState) {
          return Scaffold(
            extendBody: true,
            body: pages[state.page],
            bottomNavigationBar: DotNavigationBar(
              marginR: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              curve: Curves.fastLinearToSlowEaseIn,
              backgroundColor: Colors.orange[200],
              currentIndex: state.page,
              onTap: (p0) {
                context.read<NaviBloc>().add(PageNaviEvent(page: p0));
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
        }
        return Scaffold(
          extendBody: true,
          body: pages[0],
          bottomNavigationBar: DotNavigationBar(
            marginR: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            curve: Curves.fastLinearToSlowEaseIn,
            backgroundColor: Colors.orange[200],
            currentIndex: 0,
            onTap: (p0) {
              context.read<NaviBloc>().add(PageNaviEvent(page: p0));
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
