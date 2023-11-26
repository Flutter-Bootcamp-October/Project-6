import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/radio_button.dart';

class Address extends StatelessWidget {
  const Address(
      {super.key,
      required this.address,
      required this.addressInfo1,
      required this.addressInfo2,
      required this.mobileNumber,
      required this.isSelected});
  final String address;
  final String addressInfo1;
  final String addressInfo2;
  final String mobileNumber;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 210,
      decoration: BoxDecoration(
        boxShadow: List.filled(
          1,
          const BoxShadow(blurRadius: 2, color: Colors.grey),
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(children: [
        const SizedBox(height: 8),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          RadioBotton(isSelected: isSelected),
          Text(address,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(width: 20),
          const Icon(Icons.edit_outlined)
        ]),
        Text(addressInfo1, style: const TextStyle(color: Colors.grey)),
        Text(addressInfo2, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.phone_android_rounded),
            Text(mobileNumber)
          ],
        )
      ]),
    );
  }
}
