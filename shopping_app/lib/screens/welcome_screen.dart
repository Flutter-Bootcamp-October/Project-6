import 'package:flutter/material.dart';
import 'package:shopping_app/consts/colors.dart';
import 'package:shopping_app/consts/global_consts.dart';
import 'package:shopping_app/extentions/navigation_extentions.dart';
import 'package:shopping_app/screens/signup_screen.dart';
import 'package:shopping_app/widgets/button_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/welcome.png',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 130),
                const Text(
                  "Universal Timekeepers of the World",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontFamily: 'RomanaBeckerDemi'),
                ),
                const SizedBox(height: 10),
                const Text(
                  sentence,
                  style: TextStyle(color: Colors.white),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: ButtonCustom(
                    buttonColor: globalButtonColor,
                    buttonChild: const Text(
                      "Get Started",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      context.removeUnitl(const SignUpScreen());
                    },
                    radius: 25,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
