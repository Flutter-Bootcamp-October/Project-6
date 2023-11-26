import 'package:flutter/material.dart';
import 'package:shopping_app/consts/colors.dart';
import 'package:shopping_app/extentions/navigation_extentions.dart';
import 'package:shopping_app/global/global.dart';
import 'package:shopping_app/models/user_model.dart';
import 'package:shopping_app/screens/bottom_nav_bar.dart';
import 'package:shopping_app/screens/signup_screen.dart';
import 'package:shopping_app/widgets/button_widget.dart';
import 'package:shopping_app/widgets/rich_text_widget.dart';
import 'package:shopping_app/widgets/textfield_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Stack(children: [
      Image.asset(
        'assets/images/signin.jpg',
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(height: 320),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text("Let's Sign in",
                      style: TextStyle(
                          color: Color(0xff1e3867),
                          fontSize: 30,
                          fontFamily: 'RomanaBeckerDemi')),
                ),
                const SizedBox(height: 10),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Fill the details below to continue.",
                        style: TextStyle(fontSize: 13))),
                const SizedBox(height: 30),
                TextFieldCustom(
                  controller: emailController,
                  hint: 'Enter Username or Email',
                  labelText: const Text("Username or Email"),
                  icon: const Icon(Icons.email_outlined),
                ),
                const SizedBox(height: 25),
                TextFieldCustom(
                  controller: passwordController,
                  isPassword: true,
                  hint: 'Enter Password',
                  labelText: const Text("Password"),
                  icon: const Icon(Icons.remove_red_eye_outlined),
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text("Forgot Password?"))),
                const SizedBox(height: 12),
                ButtonCustom(
                  buttonColor: globalButtonColor,
                  buttonChild: const Text(
                    "Sign in",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    String results = preformedChecks(
                        emailController, passwordController, context);
                    if (results.isNotEmpty) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(results)));
                    } else {
                      context.removeUnitl(const AppBottonNabBar());
                      ;
                    }
                  },
                  radius: 20,
                ),
                const SizedBox(height: 10),
                const Text("OR"),
                const SizedBox(height: 10),
                ButtonCustom(
                  buttonColor: const Color(0xfff9f8f8),
                  buttonChild: const Text(
                    "Sign in with Google",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {},
                  radius: 20,
                ),
                const SizedBox(height: 20),
                const RichTextCustom(
                  text1: 'New to ADS Watch? ',
                  text2: 'Sign up',
                  screen: SignUpScreen(),
                )
              ],
            ),
          ),
        ),
      )
    ]);
  }

  String preformedChecks(TextEditingController emailController,
      TextEditingController passwordController, BuildContext context) {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      if (usersList
          .where((element) => element.email == emailController.text)
          .isEmpty) {
        return "No account with this email was found";
        //sign up?
      } else {
        bool notFound = true;
        for (User user in usersList) {
          if (user.email == emailController.text &&
              user.password == passwordController.text) {
            notFound = false;
            currentUser = user;
            return "";
          }
        }
        if (notFound) {
          return "Incorrect Password";
        }
      }
    }
    return "Please fill out all required fields";
  }
}
