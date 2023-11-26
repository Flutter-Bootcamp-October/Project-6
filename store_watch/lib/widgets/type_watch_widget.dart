import 'package:flutter/material.dart';

class TypeWatchWidget extends StatelessWidget {
  const TypeWatchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 90,
          decoration: BoxDecoration(
              color: Colors.orange[200],
              borderRadius: const BorderRadius.all(Radius.circular(15))),
          child: const Center(
              child: Text(
            "Trending",
            style: TextStyle(fontFamily: 'Lora'),
          )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: 40,
            width: 90,
            decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: const Center(
                child: Text(
              "Popular",
              style: TextStyle(fontFamily: 'Lora', color: Colors.grey),
            )),
          ),
        ),
        Container(
          height: 40,
          width: 90,
          decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: const Center(
              child: Text(
            "New",
            style: TextStyle(fontFamily: 'Lora', color: Colors.grey),
          )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: 40,
            decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: const Center(
                child: Text(
              "Best Collection",
              style: TextStyle(fontFamily: 'Lora', color: Colors.grey),
            )),
          ),
        ),
      ],
    );
  }
}
