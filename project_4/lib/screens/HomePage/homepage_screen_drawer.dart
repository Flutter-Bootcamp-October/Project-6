import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:project_4/screens/HomePage/homepage_screen.dart';
import 'package:project_4/screens/order/order_screen.dart';
import 'package:project_4/screens/profile/profile_screen.dart';
import 'package:project_4/screens/sign_in_screen.dart';

class HomePageScreenDrawer extends StatelessWidget {
  const HomePageScreenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final advancedDrawerController = AdvancedDrawerController();
    return AdvancedDrawer(
      controller: advancedDrawerController,
      openRatio: 0.35,
      openScale: 0.8,
      drawer: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 58,
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OrderScreen(isBottomNavBar: false),
                        ));
                  },
                  child: const Text("Order Screen", style: TextStyle(fontSize: 20))),
              const SizedBox(
                height: 8,
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ));
                  },
                  child: const Text("Profile page", style: TextStyle(fontSize: 20))),
              const SizedBox(
                height: 8,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => const SignInScreen()));
                },
                child: const Text("Log Out",
                    style: TextStyle(
                        color: Color(0xFFDA9E3F), fontSize: 20, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ),
      ),
      child: HomePageScreen(
        advancedDrawerController: advancedDrawerController,
      ),
    );
  }
}
