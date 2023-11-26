import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/blocs/bloc_auth/auth_bloc.dart';
import 'package:shopping_app/consts/colors.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/screens/signin_screen.dart';
import 'package:shopping_app/widgets/button_widget.dart';
import 'package:shopping_app/widgets/rich_text_widget.dart';
import 'package:shopping_app/widgets/textfield_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: true,
          body: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is SignUpSuccessedState) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInScreen(product: product),
                  ),
                  (route) => false,
                );
              } else if (state is ErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 310),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Let's Sign up",
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
                        "Let's sign up to get rewards",
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                    const SizedBox(height: 43),
                    TextFieldCustom(
                      controller: emailController,
                      hint: 'Enter Username or Email',
                      labelText: const Text("Username or Email"),
                      icon: const Icon(Icons.email_outlined),
                    ),
                    const SizedBox(height: 25),
                    TextFieldCustom(
                      controller: nameController,
                      hint: 'Enter Name Here',
                      labelText: const Text("Full Name"),
                      icon: const Icon(Icons.person),
                    ),
                    const SizedBox(height: 25),
                    TextFieldCustom(
                      controller: passwordController,
                      isPassword: true,
                      hint: 'Enter Password',
                      labelText: const Text("Password"),
                      icon: const Icon(Icons.remove_red_eye_outlined),
                    ),
                    const SizedBox(height: 25),
                    ButtonCustom(
                      buttonColor: globalButtonColor,
                      buttonChild: const Text(
                        "Sign up",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        context.read<AuthBloc>().add(SignUpEvent(
                            nameController.text,
                            emailController.text,
                            passwordController.text));
                      },
                      radius: 20,
                    ),
                    const SizedBox(height: 70),
                    RichTextCustom(
                      text1: 'Joined us before? ',
                      text2: 'Sign in',
                      screen: SignInScreen(product: product),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
