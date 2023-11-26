import 'package:flutter/material.dart';
import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';
import 'package:shopping_watch_application_bloc/views/logo_view/logo_widget/logo_page_view.dart';

class LogoScreen extends StatelessWidget {
  const LogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: appColorWhite,
        body: PageView(
          children: const [
            LogoPageView(
              swipeColorFirst: appColorYellow,
              swipeColorSecond: appColorDarkGrey,
              swipeColorTheird: appColorDarkGrey,
            ),
            LogoPageView(
              swipeColorFirst: appColorDarkGrey,
              swipeColorSecond: appColorYellow,
              swipeColorTheird: appColorDarkGrey,
            ),
            LogoPageView(
              swipeColorFirst: appColorDarkGrey,
              swipeColorSecond: appColorDarkGrey,
              swipeColorTheird: appColorYellow,
            ),
          ],
        ),
      ),
    );
  }
}
