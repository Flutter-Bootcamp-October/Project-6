import 'package:flutter/material.dart';
import 'package:shopingpriject/widgets/custom_search.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 10, left: 10),
              child: SearchBar(
                  leading: Icon(Icons.search),
                  trailing: <Widget>[Icon(Icons.close)]),
            ),
            SizedBox(height: 20),
            SearchWidget(
              text: "Eco-Drive Bracelet",
            ),
            SearchWidget(
              text: "Zeitwerk Date",
            ),
            SearchWidget(
              text: "Tourbillion Gold",
            )
          ],
        ),
      ),
    );
  }
}
