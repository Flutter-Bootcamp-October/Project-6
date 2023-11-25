import 'package:flutter/material.dart';
import 'package:shopingpriject/Home/proudcts_gridview.dart';
import 'package:shopingpriject/data/global.dart';
import 'package:shopingpriject/data/proudct_data.dart';
import 'package:shopingpriject/models/product_model.dart';
import 'package:shopingpriject/screens/filter_screen.dart';
import 'package:shopingpriject/wedgets/filter_wedget.dart';
import 'package:shopingpriject/wedgets/tap_bar.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool selcted = false;
  @override
  void initState() {
    listProucts = [];
    for (var element in proudctData) {
      listProucts.add(Product.fromJson(element));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                badges.Badge(
                  badgeContent: Text("1"),
                  child: Icon(Icons.shopping_bag_rounded),
                ),
                Container(
                    width: 150,
                    height: 50,
                    child: Image.asset(
                      "lib\\assets\\imges\\img10.png",
                      fit: BoxFit.fitWidth,
                    )),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FilterScreen(),
                          ));
                    },
                    child: Icon(Icons.filter_list))
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Hello",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff263961)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Choose Your Top Brands",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          SizedBox(
            width: 380,
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                InkWell(
                    onTap: () {
                      selcted = true;
                      setState(() {
                        if (selcted == true) {
                          color = Colors.black;
                        }
                      });
                    },
                    child: TapBar(
                      text: 'Treding',
                      color: Color(0xfffdc871),
                      textcolor: Colors.black,
                    )),
                SizedBox(
                  width: 5,
                ),
                TapBar(
                  text: "Poupular",
                  color: Color(0xffffffff),
                  textcolor: Color(0xffbfbfbf),
                ),
                SizedBox(
                  width: 5,
                ),
                TapBar(
                  text: "New",
                  color: Color(0xffffffff),
                  textcolor: Color(0xffbfbfbf),
                ),
                SizedBox(
                  width: 5,
                ),
                TapBar(
                  text: "Best Collection",
                  color: Color(0xffffffff),
                  textcolor: Color(0xffbfbfbf),
                ),
                SizedBox(
                  width: 5,
                ),
                TapBar(
                  text: "text",
                  color: Color(0xffffffff),
                  textcolor: Color(0xffbfbfbf),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [],
            ),
          ),
          ProductsGridView(),
        ],
      ),
    );
  }
}
