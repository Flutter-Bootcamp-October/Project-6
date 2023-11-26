import 'package:flutter/material.dart';
import 'package:watch_store/screens/main_app_screens/settings_screen.dart';
import 'package:watch_store/styles/custom_colors.dart';
import 'package:watch_store/widgets/category_widget.dart';
import 'package:watch_store/widgets/products_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SettingsScreen()));
          },
          child: Icon(
            Icons.settings,
            color: black,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 30,
                width: 30,
                child: Image.asset("assets/image 79.png")),
            Text(
              "ADS Watch",
              style: TextStyle(color: secondary),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.sort,
              color: black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 160, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff233B67)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Choose Your Top Brands",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const CategoryWidget(),
            const ProductWidget(),
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "Trending Watch",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 170,
                  ),
                  Text(
                    "See All",
                    style: TextStyle(color: Color(0xff233B67), fontSize: 16),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 200,
              width: 450,
              child: Image.asset("assets/Group 5.png"),
            ),
          ],
        ),
      ),
    );
  }
}
