import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wach_store_app/BLoCs/auth_bloc/auth_bloc.dart';
import 'package:wach_store_app/BLoCs/auth_bloc/auth_event.dart';
import 'package:wach_store_app/BLoCs/auth_bloc/auth_state.dart';
import 'package:wach_store_app/screens/nav_bar.dart';
import 'package:wach_store_app/screens/signin_screen.dart';
import 'package:wach_store_app/widgets/back_ground_image.dart';
import 'package:wach_store_app/widgets/blue_bold_text.dart';
import 'package:wach_store_app/widgets/custom_button.dart';
import 'package:wach_store_app/widgets/custom_password_text_field.dart';
import 'package:wach_store_app/widgets/custom_text_field.dart';
import 'package:wach_store_app/widgets/new_to_ADS.dart';
import 'package:wach_store_app/widgets/sign_in_logo.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  TextEditingController nameController = TextEditingController(),
      emailController = TextEditingController(),
      passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        child: Stack(
          children: [
            BackGroundImage(src: 'lib/assets/images/watch-9.png'),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(width: MediaQuery.sizeOf(context).width),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.20),
                    SignInLogo(),
                    SizedBox(height: 24),
                    BlueBoldText(
                      text: 'Let\'s Sign In',
                      size: 32,
                    ),
                    Text(
                      'Let\'s sign up to get rewards.',
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 32),
                    CustomTextField(
                      hint: 'Enter Username or Email',
                      label: 'Email',
                      icon: Icons.mail_outline_rounded,
                      controller: emailController,
                      isPass: false,
                    ),
                    SizedBox(height: 32),
                    CustomTextField(
                      hint: 'Enter Name Here',
                      label: 'Full Name',
                      icon: Icons.person_outline_sharp,
                      controller: nameController,
                      isPass: false,
                    ),
                    SizedBox(height: 32),
                    CustomPasswordTextField(
                      hint: 'Enter Password',
                      label: 'Password',
                      icon: Icons.remove_red_eye_outlined,
                      controller: passwordController,
                    ),
                    SizedBox(height: 32),
                    BlocListener<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is AuthSuccessState) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WachNavigationBar(),
                            ),
                            (route) => false,
                          );
                        } else if (state is AuthErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("This email is used")));
                        } else if (state is AuthEmptyState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("All fields are requied")));
                        }
                      },
                      child: CustomButton(
                          text: 'Sign up',
                          onTap: () {
                            context.read<AuthBloc>().add(
                                  SignUpEvent(
                                    email: emailController.text,
                                    name: nameController.text,
                                    password: passwordController.text,
                                  ),
                                );
                          }),
                    ),
                    SizedBox(height: 48),
                    MemberCheck(
                      leftText: 'Joind us before? ',
                      rightText: 'Sign in',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInScreen()));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
