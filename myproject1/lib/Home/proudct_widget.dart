import 'package:flutter/material.dart';
import 'package:shopingpriject/models/product_model.dart';

class ProudctWidget extends StatefulWidget {
  const ProudctWidget({super.key,  required this.proudct,  });
  final Product proudct;
  @override
  State<ProudctWidget> createState() => _ProudctWidgetState();
}

class _ProudctWidgetState extends State<ProudctWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Row(children: [
       SizedBox(
      height: 370,
      width: 370,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
         Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 200,
              height: 370,
              child: Stack(children: [
                Container(width: 200,height: 370,color: Colors.amber,),
                  
                   Image.asset("lib\\assets\\imges\\img5.png",width: 200,height: 200,),
                
                
              ],),
            ),
           
          ],)
    
      ],),
    )
    ],),);
  }
}