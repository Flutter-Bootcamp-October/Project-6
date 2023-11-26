import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/bloc/filter_bloc/filter_bloc.dart';
import 'package:project_4/screens/check_out/widgets/title_row.dart';
import 'package:project_4/widgets/custom_app_bar.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import '../../widgets/custom_button.dart';
import 'widgets/filter_chips.dart';

import 'widgets/filter_range_slider.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      "All watches",
      "Metallic",
      "Leather",
      "Expensive",
      "Classic",
    ];
    List<String> sortBy = [
      "Price",
      "Rating",
      "Popularity",
      "Top Selling",
      "Deals & Discounts",
    ];

    return Scaffold(
      appBar: customAppBar(
        title: "Filter",
        context: context,
        hasAction: true,
        onPressedFunc: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleRow(content: "Select Categories"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BlocBuilder<FilterBloc, FilterState>(
              builder: (context, state) {
                return FilterChips(
                  state: state,
                  chipList: categories,
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          const TitleRow(content: "Sort Watches By"),
          BlocBuilder<FilterBloc, FilterState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: FilterChips(
                  state: state,
                  chipList: sortBy,
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          const TitleRow(content: "Select a Price Range"),
          const SizedBox(height: 10),
          SfRangeSliderTheme(
            data: SfRangeSliderThemeData(
              thumbColor: Colors.white,
              activeTrackColor: Colors.orangeAccent,
            ),
            child: const FilterRangeSlider(),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButton(
        content: 'Apply',
        hasIcon: false,
        onPressedFunc: () {},
      ),
    );
  }
}
