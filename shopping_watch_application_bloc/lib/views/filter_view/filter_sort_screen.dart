import 'package:flutter/material.dart';
import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';
import 'package:shopping_watch_application_bloc/views/filter_view/sort_filter_widget/app_bar_sort_filter_screen.dart';

class FilterSortScreen extends StatelessWidget {
  const FilterSortScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: appColorWhite,
        appBar: AppBarSortFilterScreen(context),
        body: const SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // PicWatchSortScreen(),
                    // WatchInfoSortScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
