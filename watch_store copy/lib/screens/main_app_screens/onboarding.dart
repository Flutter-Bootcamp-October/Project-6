import 'package:flutter/material.dart';
import 'package:watch_store/screens/auth_screens/login_screen.dart';
import 'package:watch_store/styles/custom_colors.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xff192436),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100, right: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Universal Timekepers \nof the World",
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold, color: bg),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "It is a long established fact that a reader will\n be distracted by the readable content.",
                      style: TextStyle(fontSize: 16, color: bg),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                  height: 400,
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 130, top: 100),
                    child: Image.asset("assets/image 88.png"),
                  )),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: primary,
                  ),
                  child: const Center(
                      child: Text(
                    "Get Started",
                    style: TextStyle(fontSize: 16),
                  )),
                ),
              )
            ],
          )),
    );
  }
}
