
import 'package:flutter/material.dart';

class TapBar extends StatelessWidget {
  final String text;
  final Color color;
  final Color textcolor;
  const TapBar({
    super.key, required this.text, required this.color, required this.textcolor,
  });
  

  @override
  Widget build(BuildContext context) {
   
    return Container(width: 100,height:
     50,decoration: BoxDecoration(borderRadius:
      BorderRadius.circular(20),color:
       color),child:
        Center(child: Text(text,style: TextStyle(color: textcolor),)),);
  }
}