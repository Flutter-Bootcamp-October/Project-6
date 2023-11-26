import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/bloc/nav_bloc/nav_State.dart';
import 'package:shopping_app/bloc/nav_bloc/nav_bloc.dart';
import 'package:shopping_app/bloc/nav_bloc/nav_event.dart';
import 'package:shopping_app/consts/colors.dart';
import 'package:shopping_app/screens/home_screen.dart';
import 'package:shopping_app/screens/profile_screen.dart';
import 'package:shopping_app/screens/search_screen.dart';

class AppBottonNabBar extends StatelessWidget {
  const AppBottonNabBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> screensList = [
      const HomeScreen(),
      const SearchScreen(),
      const HomeScreen(),
      const ProfileScreen()
    ];
    return BlocBuilder<NavBloc, NavState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 16, left: 40, right: 40),
            child: DotNavigationBar(
              paddingR: const EdgeInsets.all(4),
              marginR: const EdgeInsets.all(0),
              currentIndex: state.index,
              onTap: (index) {
                context.read<NavBloc>().add(NavEvent(index));
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
          ),
          body: Expanded(child: screensList[state.index]),
        );
      },
    );
  }
}
