import 'package:flutter/material.dart';
import 'package:wach_store_app/widgets/appbar/app_bar.dart';
import 'package:wach_store_app/widgets/edit_button.dart';
import 'package:wach_store_app/widgets/filter_widget/category_widget.dart';

class FilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(context, true, Icons.close, 'Filter', () {
          Navigator.pop(context);
        }),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Select Category',
              style: TextStyle(
                fontFamily: 'Crimson',
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CategoryWidget(
                      text: 'All Waches',
                    ),
                    CategoryWidget(
                      text: 'Metallic',
                    ),
                    CategoryWidget(
                      text: 'Leather',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  CategoryWidget(
                    text: 'Expensive',
                  ),
                  CategoryWidget(
                    text: 'Classical',
                  ),
                ])
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Sort Watches By',
              style: TextStyle(
                fontFamily: 'Crimson',
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CategoryWidget(
                      text: 'Price',
                    ),
                    CategoryWidget(
                      text: 'Rating',
                    ),
                    CategoryWidget(
                      text: 'Popularity',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CategoryWidget(
                      text: 'Top Selling',
                    ),
                    CategoryWidget(
                      text: 'Deals & Discounts',
                      isTextlong: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Select a Price Range',
              style: TextStyle(
                fontFamily: 'Crimson',
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: RangeSlider(
                labels: const RangeLabels('\$350', '\$1100'),
                inactiveColor: Colors.grey,
                activeColor: const Color(0xfffbcf7a),
                min: 0,
                max: 2000,
                divisions: 100,
                values: const RangeValues(350, 1100),
                onChanged: (RangeValues values) {},
              )),
          const Spacer(),
          Padding(
              padding: EdgeInsets.all(16),
              child: EditButton(text: 'Apply', onTap: () {}))
        ]));
  }
}
