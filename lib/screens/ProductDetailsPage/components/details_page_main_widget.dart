import 'package:flutter/material.dart';
import 'package:project_6/models/watch_model.dart';
import 'package:project_6/widgets/circle_icon.dart';

import 'product_background_widget.dart';

class DetailsPageMainWidget extends StatelessWidget {
  const DetailsPageMainWidget({
    super.key,
    required this.watch,
  });
  final Watch watch;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductBackgroundWidget(
          watch: watch,
        ),
        Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            watch.name,
                            style: const TextStyle(
                                fontSize: 24,
                                color: Color(0xff294475),
                                fontFamily: 'DMSerifText'),
                          ),
                          Text(
                            "₹${watch.price}",
                            style: const TextStyle(
                                fontSize: 24, fontFamily: 'DMSerifText'),
                          ),
                        ],
                      ),
                      const Spacer(),
                      CircleIcon(iconData: Icons.remove, onPressedFunc: () {}),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        //quantity
                        "1",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      CircleIcon(iconData: Icons.add, onPressedFunc: () {}),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    watch.description,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
