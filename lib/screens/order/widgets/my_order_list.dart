import 'package:flutter/material.dart';
import 'package:project_6/data/constants.dart';
import 'package:project_6/widgets/circle_icon.dart';

class MyOrderList extends StatelessWidget {
  const MyOrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "assets/images/my_order_watch1.png",
      "assets/images/my_order_watch2.png",
      "assets/images/my_order_watch3.png",
    ];
    List<String> names = [
      "Zeitwerk Date",
      "Chronograph Radio",
      "Eco-Drive Baracelet",
    ];
    List<String> description = [
      "It is a long established fact that a reader will be.",
      "It is a long established fact that a reader will be.",
      "It is a long established fact that a reader will be.",
    ];
    List<double> price = [
      3050,
      3100,
      4699,
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .24,
                          height: MediaQuery.of(context).size.height * .145,
                          decoration: const BoxDecoration(
                              color: Color(0xFFF7F6F6),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  topLeft: Radius.circular(60))),
                        ),
                        Positioned(
                          right: 33,
                          top: -23,
                          child: Image.asset(
                            fit: BoxFit.cover,
                            images[index],
                            scale: 5,
                          ),
                        ),
                      ],
                    )),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        names[index],
                        style: const TextStyle(
                            color: Color(0xFF233B66),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        description[index],
                        style: const TextStyle(color: Color(0xFF847F7F)),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "$rupeeIcon${price[index]}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      CircleIcon(iconData: Icons.remove, onPressedFunc: () {}),
                      const Text(
                        "1",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w400),
                      ),
                      CircleIcon(iconData: Icons.add, onPressedFunc: () {}),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
