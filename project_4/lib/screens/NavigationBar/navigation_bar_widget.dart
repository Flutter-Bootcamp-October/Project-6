import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/bloc/buttom_nav_bloc/bottom_nav_bloc.dart';
import 'package:project_4/screens/HomePage/homepage_screen_drawer.dart';
import 'package:project_4/screens/SearchPage/search_screen.dart';
import 'package:project_4/screens/order/order_screen.dart';
import 'package:project_4/screens/profile/profile_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const HomePageScreenDrawer(),
      const SearchScreen(),
      const OrderScreen(isBottomNavBar: true),
      const ProfileScreen(),
    ];

    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          extendBody: true,
          body: screens[state.selectedIndex],
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Visibility(
              visible: state.selectedIndex != 2,
              child: DotNavigationBar(
                backgroundColor: const Color(0xfffccf78),
                margin: const EdgeInsets.only(left: 10, right: 10),
                currentIndex: state.selectedIndex,
                borderRadius: 20,
                dotIndicatorColor: const Color(0xff24283b),
                unselectedItemColor: Colors.black,
                splashBorderRadius: 50,
                selectedItemColor: const Color(0xFF292E41),
                enablePaddingAnimation: true,
                onTap: (int i) {
                  context.read<BottomNavBloc>().add(ChangeIndexEvent(index: i));
                },
                items: [
                  navigationBarIcons(Icons.home_outlined),
                  navigationBarIcons(Icons.search),
                  navigationBarIcons(Icons.shopping_bag_outlined),
                  navigationBarIcons(Icons.person_outline),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  DotNavigationBarItem navigationBarIcons(IconData iconData) {
    return DotNavigationBarItem(
      icon: Icon(
        iconData,
      ),
      selectedColor: const Color(0xff24283b),
    );
  }
}
