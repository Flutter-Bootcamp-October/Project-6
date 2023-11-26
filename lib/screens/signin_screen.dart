import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wach_store_app/BLoCs/auth_bloc/auth_bloc.dart';
import 'package:wach_store_app/BLoCs/auth_bloc/auth_event.dart';
import 'package:wach_store_app/BLoCs/auth_bloc/auth_state.dart';
import 'package:wach_store_app/screens/nav_bar.dart';
import 'package:wach_store_app/screens/signup_screen.dart';
import 'package:wach_store_app/widgets/back_ground_image.dart';
import 'package:wach_store_app/widgets/blue_bold_text.dart';
import 'package:wach_store_app/widgets/custom_button.dart';
import 'package:wach_store_app/widgets/custom_button_with_icon.dart';
import 'package:wach_store_app/widgets/custom_password_text_field.dart';
import 'package:wach_store_app/widgets/custom_text_field.dart';
import 'package:wach_store_app/widgets/forget_password.dart';
import 'package:wach_store_app/widgets/new_to_ADS.dart';
import 'package:wach_store_app/widgets/or.dart';
import 'package:wach_store_app/widgets/sign_in_logo.dart';

// ignore: must_be_immutable
class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        child: Stack(
          children: [
            BackGroundImage(src: 'lib/assets/images/watch-8.png'),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(width: MediaQuery.sizeOf(context).width),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.20),
                    const SignInLogo(),
                    const SizedBox(height: 24),
                    BlueBoldText(
                      text: 'Let\s Sign In',
                      size: 32,
                    ),
                    const Text(
                      'Fill the setails below to continue.',
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 32),
                    CustomTextField(
                      hint: 'Enter Username or Email',
                      label: 'Email',
                      icon: Icons.mail_outline_rounded,
                      controller: emailController,
                      isPass: false,
                    ),
                    const SizedBox(height: 32),
                    CustomPasswordTextField(
                      hint: 'Enter Password',
                      label: 'Password',
                      icon: Icons.remove_red_eye_outlined,
                      controller: passwordController,
                    ),
                    const SizedBox(height: 16),
                    const ForgetPassword(),
                    const SizedBox(height: 32),
                    BlocListener<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is AuthSuccessState) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WachNavigationBar(),
                            ),
                            (route) => false,
                          );
                        } else if (state is AuthEmptyState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("All fields are required")));
                        } else if (state is AuthErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("email or password are incorrect")));
                        }
                      },
                      child: CustomButton(
                        text: 'Sign in',
                        onTap: () {
                          context.read<AuthBloc>().add(
                                SignInEvent(
                                    email: emailController.text,
                                    password: passwordController.text),
                              );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Or(),
                    const SizedBox(height: 16),
                    const CustomButtonWithIcon(),
                    const SizedBox(height: 16),
                    MemberCheck(
                      leftText: 'New To ADS Watch? ',
                      rightText: 'Sign Up',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
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
