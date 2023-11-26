import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:wach_store_app/global/global.dart';
import 'package:wach_store_app/screens/my_order_screen.dart';
import 'package:wach_store_app/screens/home_screen.dart';
import 'package:wach_store_app/screens/profile_screen.dart';
import 'package:wach_store_app/screens/search_screen.dart';

class WachNavigationBar extends StatefulWidget {
  const WachNavigationBar({super.key});

  @override
  State<WachNavigationBar> createState() => _WachNavigationBarState();
}

class _WachNavigationBarState extends State<WachNavigationBar> {
  var selectedTab = SelectedTab.home;
  int index = 0;
  List screen = [
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    const ProfileScreen()
  ];

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screen[index],
      bottomNavigationBar: DotNavigationBar(
        backgroundColor: const Color(0xfffbcf7a),
        currentIndex: SelectedTab.values.indexOf(selectedTab),
        unselectedItemColor: Colors.black,
        onTap: (int i) {
          index = i;
          selectedTab = SelectedTab.values[i];
          setState(() {});
        },
        items: [
          DotNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            selectedColor: const Color(0xff163368),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.search),
            selectedColor: const Color(0xff163368),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.shopping_bag_outlined),
            selectedColor: const Color(0xff163368),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.person_outlined),
            selectedColor: const Color(0xff163368),
          ),
        ],
      ),
    );
  }
}
