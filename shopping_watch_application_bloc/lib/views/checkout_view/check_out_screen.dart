import 'package:flutter/material.dart';
import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';
import 'package:shopping_watch_application_bloc/views/checkout_view/checkout_widget/app_bar_checkout_screen.dart';
import 'package:shopping_watch_application_bloc/views/checkout_view/checkout_widget/checkout_content.dart';


class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: appColorWhite,
          appBar: AppBarCheckOutScreen(context),
          body: const CheckOutContent()),
    );
  }
}
