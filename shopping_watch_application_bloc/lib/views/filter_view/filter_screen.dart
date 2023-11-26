import 'package:flutter/material.dart';
import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';
import 'package:shopping_watch_application_bloc/views/filter_view/filter_screen/app_bar_filter_screen.dart';
import 'package:shopping_watch_application_bloc/views/filter_view/filter_screen/apply_buttom.dart';
import 'package:shopping_watch_application_bloc/views/filter_view/filter_screen/categories_container_filter_screnn.dart';
import 'package:shopping_watch_application_bloc/views/filter_view/filter_screen/range_slider.dart';
import 'package:shopping_watch_application_bloc/views/filter_view/filter_screen/sort_container_filter_screen.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: appColorWhite,
        appBar: AppBarFilterScreen(context),
        body: const Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Categories",
                  style: TextStyle(
                      fontFamily: 'PlayfairDisplay',
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: appColorBlue),
                ),
                height16,
                CategoriesContainerFilterScreen(),
                Text(
                  "Sort Watches By",
                  style: TextStyle(
                      fontFamily: 'PlayfairDisplay',
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: appColorBlue),
                ),
                height18,
                SortContainerFilterScreen(),
                Text(
                  "Select a Price Rang",
                  style: TextStyle(
                      fontFamily: 'PlayfairDisplay',
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: appColorBlue),
                ),
                RangeSliderFilterScreen(),
                ApplyButtom()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
