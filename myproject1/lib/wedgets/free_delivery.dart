
  import 'package:flutter/material.dart';

Padding FreeDelivery() {
    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text("Delivery Free",style: TextStyle(color: Colors.green,fontSize: 17),),
                            Text(" Free",style: TextStyle(color: Colors.green,fontSize: 17),)
                        ],),
                      );
  }
