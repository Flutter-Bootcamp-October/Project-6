import 'package:flutter/material.dart';
import 'package:shopingpriject/custom_profiletextfield.dart/custom_button.dart';
import 'package:shopingpriject/widgets/fillter_conterners.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  RangeValues _currentRangeValues = const RangeValues(0.2, 0.8);

  // Keeps track of container selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
            // Handle back button click
          },
        ),
        title: Text(
          "Filtter",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
            onPressed: () {
              // Handle close button click
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Select Categories",
                  style: TextStyle(fontSize: 20, fontFamily: "Unna")),
            ),
            Row(
              children: [
                TaperedContainer(category: "All Watches"),
                SizedBox(
                  width: 20,
                ),
                TaperedContainer(category: "Metallic"),
                SizedBox(
                  width: 20,
                ),
                TaperedContainer(
                  category: "Leather",
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                TaperedContainer(category: "Expensive"),
                SizedBox(
                  width: 20,
                ),
                TaperedContainer(category: "Classical"),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text("Sort Watches By",
                style: TextStyle(fontSize: 20, fontFamily: "Unna")),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                TaperedContainer(category: "Price"),
                SizedBox(
                  width: 20,
                ),
                TaperedContainer(category: "Rating"),
                SizedBox(
                  width: 20,
                ),
                TaperedContainer(category: "Popularity"),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                TaperedContainer(category: "Top Selling"),
                SizedBox(
                  width: 20,
                ),
                TaperedContainer(category: "Discounts"),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text("Select a Price Range",
                style: TextStyle(fontSize: 20, fontFamily: "Unna")),
            RangeSlider(
                values: _currentRangeValues,
                min: 0,
                max: 100,
                divisions: 100,
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                  });
                },
                activeColor: Colors.amber,
                inactiveColor: Colors.grey),
            Padding(
              padding: const EdgeInsets.only(top: 200, right: 20),
              child: CustomButton(
                text: 'Apply',
                buttonColor: Colors.amber,
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
