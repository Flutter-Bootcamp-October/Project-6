import 'package:flutter/material.dart';
import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';

class PicWatchSortScreen extends StatelessWidget {
  const PicWatchSortScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100,
          width: 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: appColorWhite),
        ),
        Positioned(
          top: 50,
          child: Container(
            height: 50,
            width: 90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: appColorColdGrey),
          ),
        ),
        Positioned(
          top: 1,
          left: 10,
          child: Center(
              child: Image.asset(
            "assets/images/watches/watch4.jpg",
            height: 70,
            width: 70,
          )),
        )
      ],
    );
  }
}
