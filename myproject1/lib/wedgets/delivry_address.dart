
  import 'package:flutter/material.dart';

Row DelivryAdrees() {
    return Row(children: [
    Container(width: 200,height: 120,decoration: BoxDecoration(boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.15), 
      spreadRadius: 0,
      blurRadius: 0, // Blur radius
      offset: Offset(0, 1), 
    ),
  ],  borderRadius: BorderRadius.circular(16),color: Colors.white,),child:Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          Icon(Icons.circle),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Text("Home"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 78),

            child: Icon(Icons.edit),
          )
          
          ],),
      ),
      Text("2972 werthimer rd",style: TextStyle(color: Color(0xff9b999a)),),
      Text("New York,10011",style: TextStyle(color: Color(0xffa7a7a7))),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Icon(Icons.phone_android),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("+1 9876543210",style: TextStyle(color: Colors.black),),
        )
      ],)
    ],),)


],);
  }