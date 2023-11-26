import 'package:flutter/material.dart';
import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';

class ContainerTopFive extends StatelessWidget {
  const ContainerTopFive({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: 320,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: const Color(0xff041a2f)),
      child: Stack(children: [
        const Positioned(
          top: 30,
          left: 13,
          child: Text(
            "The Most\n Wonderfull Watch",
            style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: appColorWhite),
          ),
        ),
        Positioned(
          left: 170,
          child: ClipOval(
            child: Image.asset(
              "assets/2.png",
              height: 190,
              width: 200,
            ),
          ),
        )
      ]),
    );
  }
}
