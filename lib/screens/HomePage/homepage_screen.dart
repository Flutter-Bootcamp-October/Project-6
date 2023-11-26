import 'package:flutter/material.dart';
import 'package:project_6/data/global_data.dart';
import 'package:project_6/data/watch_data_set.dart';
import 'package:project_6/models/watch_model.dart';

import 'components/app_bar_widget.dart';
import 'components/category_component.dart';
import 'components/product_list_widget.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    for (var element in watches) {
      watchesList.add(Watch.fromJson(element));
      print(watchesList[0]);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: homeAppBarWidget(),
      body: const Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello",
              style: TextStyle(
                  fontSize: 28,
                  color: Color(0xff294475),
                  fontFamily: 'DMSerifText'),
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
