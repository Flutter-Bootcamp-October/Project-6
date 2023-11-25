import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/bloc/cart_bloc/cart_bloc.dart';
import 'package:shopping_app/bloc/nav_bloc/nav_bloc_bloc.dart';
import 'package:shopping_app/screens/home_screen.dart';
import 'package:shopping_app/screens/my_order_screen.dart';
import 'package:shopping_app/screens/profile_screen.dart';
import 'package:shopping_app/screens/search_screen.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> screensList = [
      const HomeScreen(),
      const SearchScreen(),
      const MyOrderScreen(),
      const ProfileScreen()
    ];
    int selected = 0;
    return BlocBuilder<NavBloc, NavBlocState>(
      builder: (context, state) {
        return Scaffold(
          //extendBody: true,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state is GetTabState ? state.index : 0,
            onTap: (index) {
              selected = index;
              if (selected == 2) {
                context.read<CartBloc>().add(ViewCartEvent());
              }
              context.read<NavBloc>().add(TabEvent(index: selected));
            },
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled, size: 30), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search, size: 30), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_outlined, size: 30), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_rounded, size: 30),
                  label: ""),
            ],
          ),
          body: screensList[selected],
        );
      },
    );
  }
}
