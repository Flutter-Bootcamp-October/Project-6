import 'package:flutter/material.dart';
import 'package:shopingpriject/data/global.dart';
import 'package:shopingpriject/wedgets/delivry_address.dart';
import 'package:shopingpriject/wedgets/discount.dart';
import 'package:shopingpriject/wedgets/free_delivery.dart';
import 'package:shopingpriject/wedgets/item_total.dart';

class ChacekOutScreen extends StatefulWidget {
  const ChacekOutScreen({
    super.key,
  });

  @override
  State<ChacekOutScreen> createState() => _ChacekOutScreenState();
}

class Proudct {}

class _ChacekOutScreenState extends State<ChacekOutScreen> {
  final TextEditingController _couponController = TextEditingController();
  double discountAmount = 0.0;
  bool isCouponApplied = false;

  void _applyCoupon() {
    if (_couponController.text == 'CODE10') {
      setState(() {
        discountAmount = globalPrice * 0.1;
        isCouponApplied = true;
      });
    } else {
      // Handle the case where the coupon code is not valid
      setState(() {
        discountAmount = 0.0;
        isCouponApplied = false;
      });
      // Show an alert or a notification to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid Coupon Code'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                ),
                Text(
                  "Checkout",
                  style: TextStyle(fontSize: 20),
                ),
                Icon(Icons.close)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Row(
              children: [
                Text(
                  "Your Order Will be ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 230, top: 5),
            child: Text("Delivered To",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            width: 360,
            height: 190,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                DelivryAdrees(),
                SizedBox(
                  width: 20,
                ),
                DelivryAdrees(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 220),
            child: Text(
              "Pyment Method",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: AutofillHints.addressState),
            ),
          ),
          Row(
            children: [
              Image.asset("lib\\assets\\imges\\madterimg.png"),
              Text("   Credit/Debit Card"),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.circle_outlined,
                  color: Color(0xffc9c9c9),
                ),
              )
            ],
          ),
          Row(
            children: [
              Image.asset("lib\\assets\\imges\\paypalimg.png"),
              Text("     Paypal"),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.circle_outlined,
                  color: Color(0xffc9c9c9),
                ),
              )
            ],
          ),
          Total(),
          Discount(),
          FreeDelivery(),
          Divider(
            thickness: 1.5,
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: TextField(
              controller: _couponController,
              decoration: InputDecoration(
                labelText: 'Coupon Code',
                suffixIcon: IconButton(
                  icon: Icon(Icons.card_giftcard),
                  onPressed: _applyCoupon,
                ),
              ),
            ),
          ),
          if (isCouponApplied)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Discount",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "-\$${discountAmount.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Grand Total",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 150,
              ),
              Text(
                "\$${(globalPrice - (globalPrice / 22) - discountAmount).toStringAsFixed(2)}",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              )
            ],
          ),
          InkWell(
              onTap: () {},
              child: Container(
                width: 360,
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    color: Color(0xfffcc874)),
                child: Center(
                    child: Text(
                  "Place Order",
                  style: TextStyle(fontSize: 18),
                )),
              ))
        ],
      ),
    );
  }
}
