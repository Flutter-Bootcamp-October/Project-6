// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_watch/blocs/bloc_Auth/bloc/auth_bloc.dart';
import 'package:store_watch/screens/signin_screen.dart';
import 'package:store_watch/widgets/button_text.dart';
import 'package:store_watch/widgets/glass_text_filde.dart';
import 'package:store_watch/widgets/header.dart';
import 'package:store_watch/widgets/praimery_button.dart';

//5
class SignUp extends StatelessWidget {
  SignUp({super.key});
  TextEditingController userNameOremailContrler = TextEditingController();
  TextEditingController nameContrler = TextEditingController();
  TextEditingController passwordContrler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 140,
            left: 200,
            child: Container(
              child: Image.asset(
                "assets/watch_login.png",
                width: 200,
              ),
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
                        child: BlocListener<AuthBloc, AuthState>(
                          listener: (context, state) {
                            if (state is SignUpSuccessedState) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignInUp(),
                                  ));
                            } else if (state is ErrorState) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    state.message,
                                  ),
                                  backgroundColor: const Color(0xffff8989),
                                  padding:
                                      const EdgeInsets.only(top: 32, left: 16),
                                ),
                              );
                            }
                          },
                          child: PraimeryButton(
                              buttonTitle: "Sign Up",
                              onPressed: () {
                                context.read<AuthBloc>().add(SignUpEvent(
                                    emailOrUsername:
                                        userNameOremailContrler.text,
                                    userName: nameContrler.text,
                                    pass: passwordContrler.text));
                              }),
                        )),
                    //////update

                    ButtonText(
                      title: "Joined us before?",
                      titleButton: " Sign in",
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignInUp())),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}







/*
  final GlobalKey<FlutterPwValidatorState> validatorKey =
      GlobalKey<FlutterPwValidatorState>();
 FlutterPwValidator(
                        key: validatorKey,
                        controller: passwordContrler,
                        minLength: 8,
                        uppercaseCharCount: 2,
                        lowercaseCharCount: 3,
                        numericCharCount: 3,
                        specialCharCount: 1,
                        normalCharCount: 3,
                        width: 320,
                        height: 320,
                        onSuccess: () {
                          print("MATCHED");
                          ScaffoldMessenger.of(context).showSnackBar(
                              new SnackBar(
                                  content: new Text("Password is matched")));
                        },
                        onFail: () {
                          print("NOT MATCHED");
                        },
                      ),
                      */