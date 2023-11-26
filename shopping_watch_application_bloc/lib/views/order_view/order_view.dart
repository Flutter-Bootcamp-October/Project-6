import 'package:flutter/material.dart';

import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';
import 'package:shopping_watch_application_bloc/views/order_view/order_widget/app_bar_order_screen.dart';
import 'package:shopping_watch_application_bloc/views/order_view/order_widget/order_info_content.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: appColorWhite,
        appBar: AppBarOrderScreen(context),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: OrderInfoContent(),
              ),
        ),
      ),
    );
  }
}
