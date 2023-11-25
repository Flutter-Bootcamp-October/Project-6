import 'package:flutter/material.dart';
import 'package:shopingpriject/data/global.dart';

Padding Total() {
    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text("Item Total ",style: TextStyle(fontSize: 17),),
                          Text("\$${globalPrice.toString()}",style: TextStyle(fontSize: 18),)
                        ],),
                      );
  }