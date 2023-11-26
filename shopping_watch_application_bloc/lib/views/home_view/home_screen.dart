import 'package:flutter/material.dart';
import 'package:shopping_watch_application_bloc/Data/global.dart';
import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';
import 'package:shopping_watch_application_bloc/views/home_view/home_widget/app_bar_home_screen.dart';
import 'package:shopping_watch_application_bloc/views/home_view/home_widget/container_Topfive.dart';
import 'package:shopping_watch_application_bloc/views/home_view/home_widget/shopping_categories.dart';
import 'package:shopping_watch_application_bloc/views/home_view/home_widget/watch_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    populateWatchList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: appColorWhite,
        appBar: AppBarHomeScreen(context),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //------------------------------
                Text(
                  "Hello",
                  style: TextStyle(
                      fontFamily: 'PlayfairDisplay',
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: appColorBlue),
                ),
                //-----------------------------
                Text(
                  "Choose Your Top Brands",
                  style: TextStyle(
                      fontFamily: 'PlayfairDisplay',
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                //----------------------------
                ShoppingCategories(),
                //----------------------------
                WatchView(),
                height28,
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Five",
                        style: TextStyle(
                            fontFamily: 'PlayfairDisplay',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: appColorBlue),
                      ),
                      Text(
                        "View All",
                        style: TextStyle(
                            fontFamily: 'PlayfairDisplay',
                            fontWeight: FontWeight.w500,
                            color: appColorGrey),
                      )
                    ],
                  ),
                ),
                height28,
                ContainerTopFive()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
