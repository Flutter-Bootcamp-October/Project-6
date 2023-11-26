import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/bloc/auth_bloc/auth.bloc.dart';
import 'package:shopping_app/bloc/auth_bloc/auth_evemt.dart';
import 'package:shopping_app/bloc/auth_bloc/auth_state.dart';
import 'package:shopping_app/consts/colors.dart';
import 'package:shopping_app/screens/bottom_nav_bar.dart';
import 'package:shopping_app/screens/signin_screen.dart';
import 'package:shopping_app/widgets/button_widget.dart';
import 'package:shopping_app/widgets/rich_text_widget.dart';
import 'package:shopping_app/widgets/textfield_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Stack(children: [
      Image.asset(
        'assets/images/signup.jpg',
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
                  const SizedBox(height: 310),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Let's Sign up",
                        style: TextStyle(
                            color: Color(0xff1e3867),
                            fontSize: 30,
                            fontFamily: 'RomanaBeckerDemi')),
                  ),
                  const SizedBox(height: 10),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Let's sign up to get rewards",
                        style: TextStyle(fontSize: 13),
                      )),
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
                  BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is SeccessAuth) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AppBottonNabBar()),
                            (route) => false);
                      } else if (state is ErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.errorMsg)));
                      }
                    },
                    child: ButtonCustom(
                      buttonColor: globalButtonColor,
                      buttonChild: const Text(
                        "Sign up",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        context.read<AuthBloc>().add(SignupEvent(
                            emailController.text,
                            passwordController.text,
                            nameController.text));
                      },
                      radius: 20,
                    ),
                  ),
                  const SizedBox(height: 70),
                  const RichTextCustom(
                    text1: 'Joined us before? ',
                    text2: 'Sign in',
                    screen: SignInScreen(),
                  )
                ],
              ),
            ),
          ))
    ]);
  }
}
