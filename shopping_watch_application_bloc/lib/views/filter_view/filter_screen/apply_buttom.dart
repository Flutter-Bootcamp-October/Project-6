import 'package:flutter/material.dart';

import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';

class ApplyButtom extends StatelessWidget {
  const ApplyButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Center(
        child: InkWell(
          onTap: () {},
          child: Container(
            height: 50,
            width: 350,
            decoration: BoxDecoration(
              color: appColorYellow,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
                child: Text(
              "Apply",
              style: TextStyle(fontSize: 15),
            )),
          ),
        ),
      ),
    );
  }
}
