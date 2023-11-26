import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:watch_store/screens/main_app_screens/cart_screen.dart';
import 'package:watch_store/screens/main_app_screens/home_screen.dart';
import 'package:watch_store/screens/auth_screens/profile_screen.dart';
import 'package:watch_store/screens/main_app_screens/search.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingNavBar(
      borderRadius: 20,
      resizeToAvoidBottomInset: false,
      color: const Color(0xffFBCC7F),
      selectedIconColor: const Color(0xff233B67),
      unselectedIconColor: Colors.black,
      items: [
        FloatingNavBarItem(
            iconData: Icons.home_outlined, page: const HomeScreen(), title: ''),
        FloatingNavBarItem(
            iconData: Icons.search, page: const SearchScreen(), title: ''),
        FloatingNavBarItem(
            iconData: Icons.shopping_bag_outlined,
            page: const CartScreen(),
            title: ''),
        FloatingNavBarItem(
            iconData: Icons.person_outline_outlined,
            page: const ProfileScreen(),
            title: ''),
      ],
      horizontalPadding: 15.0,
      hapticFeedback: true,
      showTitle: false,
    );
  }
}
