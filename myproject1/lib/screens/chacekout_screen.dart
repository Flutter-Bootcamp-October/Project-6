import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopingpriject/blocs/bloc/bloc4/bloc/coupon_bloc.dart';
import 'package:shopingpriject/blocs/bloc/bloc4/bloc/coupon_event.dart';
import 'package:shopingpriject/blocs/bloc/bloc4/bloc/coupon_state.dart';
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

  /*void _applyCoupon() {
    if (_couponController.text == 'CODE10') {
      setState(() {
        discountAmount = globalPrice * 0.1;
        isCouponApplied = true;
      });
    } else {
      setState(() {
        discountAmount = 0.0;
        isCouponApplied = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid Coupon Code'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CouponBloc(),
      child: BlocListener<CouponBloc, CouponState>(
        listener: (context, state) {
          if (state is CouponErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          }
        },
        child: BlocBuilder<CouponBloc, CouponState>(
          builder: (context, state) {
            double discountAmount = 0.0;
            bool isCouponApplied = false;

            if (state is CouponAppliedState) {
              discountAmount = state.discountAmount;
              isCouponApplied = true;
            }
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
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 230, top: 5),
                    child: Text("Delivered To",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: 350,
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
                      Image.asset("lib/assets/imges/madterimg.png"),
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
                      Image.asset("lib/assets/imges/paypalimg.png"),
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
                            onPressed: () {
                              context.read<CouponBloc>().add(
                                    ApplyCouponEvent(_couponController.text),
                                  );
                            }),
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
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "-\$${discountAmount.toStringAsFixed(2)}",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Grand Total",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      Text(
                        "\$${(globalPrice - (globalPrice / 22) - discountAmount).toStringAsFixed(2)}",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
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
          },
        ),
      ),
    );
  }
}
