import 'package:flutter/material.dart';
import 'package:store_watch/widgets/button_widget.dart';

import '/models/user_model.dart';
import '../data/global.dart';
import '../widgets/card_defelt.dart';
import '../widgets/my_card.dart';
import '../widgets/payment_widget.dart';
import '../widgets/text_title_widget.dart';
import '../widgets/two_text.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CheckoutScreen> {
  int groupValue = 0;

  List<User> deliveryInfo = [];

  TextEditingController textLocation = TextEditingController();
  TextEditingController textDescription = TextEditingController();
  TextEditingController textPhone = TextEditingController();
  TextEditingController textLocation2 = TextEditingController();
  TextEditingController textDescription2 = TextEditingController();
  TextEditingController textPhone2 = TextEditingController();
  final String m3 = "775060+65+";

  @override
  void initState() {
    super.initState();
    // deliveryInfo;
    // deliveryInfo2;
  }

  bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafafa),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(0xff141922),
            )),
        title: const Text(
          "Checkout",
          style: TextStyle(color: Color(0xff141922)),
        ),
        actions: [
          InkWell(
            child: const Icon(
              Icons.close,
              color: Color(0xff141922),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextTitleWidget(
                textTitle: 'Your Order will be',
              ),
              const SizedBox(
                height: 6,
              ),
              const TextTitleWidget(
                textTitle: 'Delivered To',
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 150,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: isEmpty == false
                      ? Wrap(
                          spacing: 10.0,
                          runSpacing: 10.0,
                          children: List.generate(2, (index) {
                            return CardDefelt(
                              onTap: () => showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return addData();
                                },
                              ),
                            );
                          }),
                        )
                      : Wrap(
                          spacing: 10.0,
                          runSpacing: 10.0,
                          children: deliveryInfo.map((user) {
                            return MyCard(
                              name: user.deliveryDetail,
                              loc: user.deliveryPlace,
                              phone: user.deliveryNumber,
                              onTap: () => showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return addData();
                                },
                              ),
                            );
                          }).toList(),
                        ),
                ),
              ),
              const TextTitleWidget(
                textTitle: 'Payment Method',
              ),
              const SizedBox(
                height: 20,
              ),
              const PaymentWidget(
                imagePayment: 'assets/masterCard.png',
                textPayment: 'Credit/Debit Card',
              ),
              const SizedBox(
                height: 10,
              ),
              const PaymentWidget(
                imagePayment: 'assets/paypal.png',
                textPayment: 'Paypal',
              ),
              const SizedBox(height: 20),
              TwoText(
                  leftText: 'Total Price',
                  rightText: '\$ ${globalPrice.toStringAsFixed(2)}'),
              TwoText(
                  leftText: 'Discount',
                  rightText: '\$ ${((globalPrice * 0.08)).toStringAsFixed(2)}'),
              TwoText(
                leftText: 'Delivery Free',
                rightText: 'Free',
                color: Colors.green[300],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              TwoText(
                leftText: 'Grand Total',
                rightText:
                    '\$ ${(globalPrice - (globalPrice * 0.08)).toStringAsFixed(2)}',
              ),
              SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ButtonWidget(
                    textButton: 'Place Order',
                    onPressed: () {},
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget addData() {
    return SizedBox(
      height: 350,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: textLocation2,
                decoration: InputDecoration(
                  hintText: 'Enter your location',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18)),
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: textDescription2,
                decoration: InputDecoration(
                  hintText: 'Enter your site details',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18)),
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: textPhone2,
                decoration: InputDecoration(
                  hintText: 'Enter your number',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18)),
                  border: InputBorder.none,
                ),
              ),
              ElevatedButton(
                  child: const Text('Add address'),
                  onPressed: () {
                    if (textLocation2.text.isEmpty ||
                        textDescription2.text.isEmpty ||
                        textPhone2.text.isEmpty) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              content: Text("Please fill out all fields"),
                            );
                          });
                    } else {
                      setState(() {
                        deliveryInfo.add(
                          User(
                            deliveryPlace: textLocation2.text,
                            deliveryDetail: textDescription2.text,
                            deliveryNumber: textPhone2.text,
                          ),
                        );
                        //deliveryInfo;
                        isEmpty = true;
                      });

                      Navigator.pop(context);
                    } //last shoud be number
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
