import 'package:flutter/material.dart';
import 'package:project_6/screens/check_out/widgets/title_row.dart';
import 'package:project_6/widgets/custom_app_bar.dart';

import 'widgets/filter_chips.dart';

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
      appBar: customAppBar(title: "Filter", context: context, hasAction: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleRow(content: "Select Categories"),
          FilterChips(chipList: categories),
          const SizedBox(height: 10),
          const TitleRow(content: "Sort Watches By"),
          FilterChips(chipList: sortBy),
          const SizedBox(height: 10),
          const TitleRow(content: "Select a Price Range"),
          RangeSlider(
            activeColor: Colors.orangeAccent,
            min: 1,
            max: 2000,
            values: const RangeValues(350, 1100),
            onChanged: (value) {},
          )
        ],
      ),
    );
  }
}
