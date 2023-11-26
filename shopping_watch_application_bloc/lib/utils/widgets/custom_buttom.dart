// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';
import 'package:shopping_watch_application_bloc/utils/widgets/custom_text.dart';

class CustomButtom extends StatelessWidget {
  CustomButtom({
    super.key,
    required this.textButtom,
    required this.onPressed,
    this.iconWidget,
    required this.colorText,
  });
  final String textButtom;
  final Function() onPressed;
  Widget? iconWidget;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 50,
          width: 350,
          decoration: BoxDecoration(
            color: appColorYellow,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconWidget ?? Container(),
              width8,
              Center(
                child: CustomText(
                  text: textButtom,
                  textSize: 15,
                  color: colorText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
