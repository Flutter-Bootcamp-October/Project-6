import 'package:flutter/material.dart';
import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';
import 'package:shopping_watch_application_bloc/views/checkout_view/checkout_widget/checkbox.dart';

class AddressContainer extends StatefulWidget {
  const AddressContainer({super.key});

  @override
  State<AddressContainer> createState() => _AddressContainerState();
}

class _AddressContainerState extends State<AddressContainer> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                height: 150,
                width: 270,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 168, 168, 168)
                            .withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 20,
                        offset: const Offset(0, 3),
                      )
                    ],
                    borderRadius: BorderRadius.circular(25),
                    color: appColorWhite),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CheckBox(),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: SizedBox(
                          width: 170,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Home",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              height12,
                              Text(
                                "2972 Westherimer RD.\nSanta ana, lllinois 85486",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 12),
                              ),
                              height12,
                              Row(
                                children: [
                                  Icon(Icons.phone_iphone_rounded),
                                  width12,
                                  Text("+61 2 4916 1349")
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned(
                left: 225,
                top: 30,
                child: Icon(
                  Icons.edit_outlined,
                  color: appColorBlue,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
