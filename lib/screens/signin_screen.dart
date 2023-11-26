import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/blocs/bloc_auth/auth_bloc.dart';
import 'package:shopping_app/consts/colors.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/screens/bottom_nav_bar.dart';
import 'package:shopping_app/screens/signup_screen.dart';
import 'package:shopping_app/widgets/button_widget.dart';
import 'package:shopping_app/widgets/rich_text_widget.dart';
import 'package:shopping_app/widgets/textfield_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccessedState) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => AppBottomNavBar(product: product),
              ),
              (route) => false,
            );
          } else if (state is ErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(height: 320),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Let's Sign in",
                    style: TextStyle(
                      color: Color(0xff1e3867),
                      fontSize: 30,
                      fontFamily: 'RomanaBeckerDemi',
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Fill the details below to continue.",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
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
                    child: const Text("Forgot Password?"),
                  ),
                ),
                const SizedBox(height: 12),
                ButtonCustom(
                  buttonColor: globalButtonColor,
                  buttonChild: const Text(
                    "Sign in",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    context.read<AuthBloc>().add(LoginEvent(
                          emailController.text,
                          passwordController.text,
                        ));
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
                  onPressed: () {
                    // Implement Google Sign-In here
                  },
                  radius: 20,
                ),
                const SizedBox(height: 20),
                RichTextCustom(
                  text1: 'New to ADS Watch? ',
                  text2: 'Sign up',
                  screen: SignUpScreen(
                    product: product,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
