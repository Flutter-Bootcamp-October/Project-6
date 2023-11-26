import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import 'components/app_bar_widget.dart';
import 'components/category_component.dart';
import 'components/product_list_widget.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key, required this.advancedDrawerController});
  final AdvancedDrawerController advancedDrawerController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          homeAppBarWidget(context: context, advancedDrawerController: advancedDrawerController),
      body: const Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello",
              style: TextStyle(fontSize: 28, color: Color(0xff294475), fontFamily: 'DMSerifText'),
            ),
            Text(
              "Choose Your Top Brands",
              style: TextStyle(fontSize: 23, fontFamily: 'DMSerifText'),
            ),
            SizedBox(
              height: 20,
            ),
            CategoryWidget(),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ProductListWidget(),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
