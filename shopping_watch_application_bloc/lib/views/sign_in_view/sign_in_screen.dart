// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shopping_watch_application_bloc/views/sign_in_view/sign_in_widget/background_pic.dart';
import 'package:shopping_watch_application_bloc/views/sign_in_view/sign_in_widget/sign_in_content.dart';
import 'package:shopping_watch_application_bloc/views/sign_in_view/sign_in_widget/logo_ADS.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const Stack(
            children: [BackgroundPic(), LogoADS(), SignInContent()],
          ),
        ),
      ),
    );
  }
}
