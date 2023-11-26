// ignore_for_file: library_private_types_in_public_api

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:store_watch/screens/home_screen.dart';
import 'package:store_watch/screens/order_screen.dart';
import 'package:store_watch/screens/profile_screen.dart';

import 'search_screen.dart';

class NaviBar extends StatefulWidget {
  const NaviBar({Key? key}) : super(key: key);

  @override
  _NaviBarState createState() => _NaviBarState();
}

int _currentIndex = 0;

class _NaviBarState extends State<NaviBar> {
  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final pages = [
    const Home(),
    const SearchScreen(),
    const OrderScreen(),
    Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[_currentIndex],
      bottomNavigationBar: DotNavigationBar(
        marginR: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        curve: Curves.fastLinearToSlowEaseIn,
        backgroundColor: Colors.orange[200],
        currentIndex: _currentIndex,
        onTap: changePage,
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
}
