// ignore_for_file: must_be_immutable
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_watch_application_bloc/blocs/auth_bloc/auth_bloc.dart';
import 'package:shopping_watch_application_bloc/blocs/auth_bloc/auth_event.dart';
import 'package:shopping_watch_application_bloc/blocs/auth_bloc/auth_state.dart';
import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';
import 'package:shopping_watch_application_bloc/utils/widgets/custom_buttom.dart';
import 'package:shopping_watch_application_bloc/utils/widgets/custom_text.dart';
import 'package:shopping_watch_application_bloc/utils/widgets/custom_text_field.dart';
import 'package:shopping_watch_application_bloc/views/nav_bar_screen.dart';
import 'package:shopping_watch_application_bloc/views/sign_in_view/sign_in_widget/google_sgin_in_buttom.dart';
import 'package:shopping_watch_application_bloc/views/sign_up_view/sign_up_screen.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class SignInContent extends StatelessWidget {
  const SignInContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 150,
            ),
            const CustomText(
              text: 'ADS Watch',
              textSize: 18,
              textFontFamily: 'PlayfairDisplay',
              color: appColorBlue,
              textFontWeight: FontWeight.bold,
            ),

            //--------------------------------

            height40,
            RichText(
              text: const TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Let\'s Sign in\n',
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'PlayfairDisplay',
                        color: appColorBlue,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'Fill the details below to continue',
                    style: TextStyle(
                      color: appColorBlue,
                    ),
                  )
                ],
              ),
            ),

            //---------------------------------

            height40,
            CustomTextField(
              controller: emailController,
              labelText: "Username or Email",
              hintText: "Enter Username or Email",
              isObscureText: false,
              hasSuffix: const Icon(
                Icons.email_outlined,
                color: appColorGrey,
              ),
            ),

            //--------------------------------

            height20,
            CustomTextField(
              controller: passwordController,
              labelText: "Password",
              hintText: "Enter Password ",
              isObscureText: true,
              hasSuffix: const Icon(
                Icons.remove_red_eye_outlined,
                color: appColorGrey,
              ),
            ),

            //--------------------------------

            const Padding(
              padding: EdgeInsets.only(left: 210),
              child: CustomText(
                text: 'Forgot Password?',
                color: appColorBlue,
                textSize: 14,
              ),
            ),

            // ---------------------------------
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is SiginSuccessedState) {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return NavBar();
                  }), (route) => false);
                } else if (state is ErrorState) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.mesg)));
                }
              },
              child: CustomButtom(
                textButtom: 'Sign in',
                colorText: appColorBlue,
                onPressed: () {
                  context.read<AuthBloc>().add(SignInEvent(
                      emailController.text, passwordController.text));
                },
              ),
            ),

            //---------------------------------

            const Padding(
              padding: EdgeInsets.only(left: 150),
              child: CustomText(
                text: 'OR',
                color: appColorBlue,
              ),
            ),

            //---------------------------------

            const GoogleSignInButtom(),

            //---------------------------------
            height20,

            Center(
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'New to ADS Watch? ',
                      style: TextStyle(
                          color: appColorDarkBlue, fontWeight: FontWeight.w400),
                    ),
                    TextSpan(
                      text: 'Sign up',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const SignUpScreen();
                              },
                            ),
                          );
                        },
                      style: const TextStyle(
                          color: appColorBlue, fontWeight: FontWeight.bold),
                    )
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
