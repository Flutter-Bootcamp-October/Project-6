// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';
import 'package:shopping_watch_application_bloc/views/sign_in_view/sign_in_widget/background_pic.dart';
import 'package:shopping_watch_application_bloc/views/sign_in_view/sign_in_widget/logo_ADS.dart';
import 'package:shopping_watch_application_bloc/views/sign_up_view/sign_up_widget/sign_up_content.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appColorWhite,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const Stack(
            children: [BackgroundPic(), LogoADS(), SignupContent()],
          ),
        ),
      ),
    );
  }
}
