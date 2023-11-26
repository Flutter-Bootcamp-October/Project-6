import 'package:flutter/material.dart';
import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';
import 'package:shopping_watch_application_bloc/views/sign_in_view/sign_in_screen.dart';
import 'package:shopping_watch_application_bloc/views/logo_view/logo_widget/dots_page.dart';
import 'package:shopping_watch_application_bloc/utils/widgets/custom_buttom.dart';

class LogoPageView extends StatelessWidget {
  const LogoPageView(
      {super.key,
      required this.swipeColorFirst,
      required this.swipeColorSecond,
      required this.swipeColorTheird});

  final Color swipeColorFirst;
  final Color swipeColorSecond;
  final Color swipeColorTheird;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            "assets/logo.png",
            fit: BoxFit.fill,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: const Color.fromARGB(29, 255, 255, 255),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Universal Timekepers\nof the World\n',
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'PlayfairDisplay',
                              color: appColorWhite,
                              fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                          text:
                              '\nIt is a long established fact that a reader will',
                          style: TextStyle(
                            color: appColorWhite,
                          ),
                        ),
                        TextSpan(
                          text: 'be distracted by the readable content',
                          style: TextStyle(
                            color: appColorWhite,
                          ),
                        )
                      ],
                    ),
                  ),
                  height26,
                  Row(
                    children: [
                      DotsLogoPageWidget(
                        colorDot: swipeColorFirst,
                      ),
                      width10,
                      DotsLogoPageWidget(
                        colorDot: swipeColorSecond,
                      ),
                      width10,
                      DotsLogoPageWidget(
                        colorDot: swipeColorTheird,
                      ),
                    ],
                  ),
                ],
              ),
              CustomButtom(
                textButtom: 'Get Statred',
                colorText: appColorBlue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const SignInScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
