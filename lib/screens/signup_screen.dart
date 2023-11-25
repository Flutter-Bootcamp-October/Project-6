// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc/blocs/auth_bloc/bloc/auth_bloc.dart';
import 'package:project_bloc/screens/signin_screen.dart';
import 'package:project_bloc/widgets/button_text.dart';
import 'package:project_bloc/widgets/header.dart';
import 'package:project_bloc/widgets/praimery_button.dart';
import 'package:project_bloc/widgets/glass_text_filde.dart';

//5
class SignUp extends StatelessWidget {
  SignUp({super.key});
  TextEditingController userNameOremailContrler = TextEditingController();
  TextEditingController nameContrler = TextEditingController();
  TextEditingController passwordContrler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                top: 140,
                left: 200,
                child: Image.asset(
                  "assets/watch_login.png",
                  width: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                        Image.asset(
                          "assets/ads_logo.png",
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        const Header(
                            title: "Let's Sign up",
                            subTitle: "Let's sign up to get rewards."),
                        const SizedBox(height: 4),
                        GlassTextFiled(
                          hint: "Enter Username or Email",
                          labelText: "Username or Email",
                          icon: Icons.email_outlined,
                          isPassword: false,
                          controller: userNameOremailContrler,
                        ),
                        const SizedBox(height: 4),
                        GlassTextFiled(
                          hint: "Enter Name Here",
                          labelText: "Full Name",
                          icon: Icons.person_outlined,
                          isPassword: false,
                          controller: nameContrler,
                        ),
                        const SizedBox(height: 4),
                        GlassTextFiled(
                          hint: "Enter Password",
                          labelText: "Password",
                          icon: Icons.lock_outline,
                          isPassword: true,
                          controller: passwordContrler,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 12, bottom: 14),
                            child: BlocConsumer<AuthBloc, AuthState>(
                              listener: (context, state) {
                                if (state is ErrorState) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(state.msg),
                                    backgroundColor: const Color(0xffFF7779),
                                  ));
                                } else if (state is AuthInitial) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignInUp(),
                                      ));
                                }
                              },
                              builder: (context, state) {
                                return PraimeryButton(
                                    buttonTitle: "Sign Up",
                                    onPressed: () {
                                      context.read<AuthBloc>().add(SignUpEvent(
                                          nameContrler.text,
                                          userNameOremailContrler.text,
                                          passwordContrler.text));
                                    });
                              },
                            )),
                        const SizedBox(height: 32),
                        ButtonText(
                          title: "Joined us before?",
                          titleButton: " Sign in",
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInUp())),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
