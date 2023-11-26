import 'package:flutter/material.dart';
import 'package:shopping_app/consts/colors.dart';
import 'package:shopping_app/consts/global_consts.dart';
import 'package:shopping_app/extentions/navigation_extentions.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/screens/signup_screen.dart';
import 'package:shopping_app/widgets/button_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 130),
            const Text(
              "Universal Timekeepers of the World",
              style: TextStyle(fontSize: 35, fontFamily: 'RomanaBeckerDemi'),
            ),
            const SizedBox(height: 10),
            const Text(
              sentence,
            ),
            const SizedBox(height: 495),
            ButtonCustom(
              buttonColor: globalButtonColor,
              buttonChild: const Text(
                "Get Started",
              ),
              onPressed: () {
                context.removeUnitl(
                  SignUpScreen(
                    product: product,
                  ),
                );
              },
              radius: 25,
            ),
          ],
        ),
      ),
    );
  }
}
