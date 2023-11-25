import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/bloc/auth/auth_bloc.dart';
import 'package:shopping_app/bloc/auth/auth_event.dart';
import 'package:shopping_app/bloc/auth/auth_state.dart';
import 'package:shopping_app/extentions/navigation_extentions.dart';
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

    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Image.asset(
            'assets/images/signup.png',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              const SizedBox(height: 300),
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
                hint: 'Enter Email',
                labelText: const Text("Email"),
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
                  if (state is AuthErrorState) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.message)));
                  }
                  if (state is SignUpSuccessState) {
                    context.removeUnitl(const SignInScreen());
                  }
                },
                child: ButtonCustom(
                  buttonChild: const Text(
                    "Sign up",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    context.read<AuthBloc>().add(SignUpEvent(
                        name: nameController.text.trim(),
                        email: emailController.text.trim(),
                        password: passwordController.text.trim()));
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
        ]));
  }
}
