import 'package:flutter/material.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget(
      {super.key, required this.imagePayment, required this.textPayment});

  final String imagePayment;
  final String textPayment;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 75,
        height: 50,
        decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(18)),
        child: Center(
          child: SizedBox(
            width: 45,
            height: 45,
            child: Image.asset(
              imagePayment,
            ),
          ),
        ),
      ),
      title: Text(
        textPayment,
        style: const TextStyle(fontSize: 17),
      ),
      trailing:
          Radio(value: 'Home', groupValue: 'Address', onChanged: (value) {}),
    );
  }
}
