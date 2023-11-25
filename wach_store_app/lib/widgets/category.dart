import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Color(0xfffcc873),
              borderRadius: BorderRadius.circular(20)),
          child: Text('Trending',
              style: TextStyle(fontSize: 16, color: Colors.black)),
        ),
        SizedBox(width: 32),
        Text('Popular',
            style: TextStyle(fontSize: 16, color: Color(0xffc6c5c5))),
        SizedBox(width: 32),
        Text('New', style: TextStyle(fontSize: 16, color: Color(0xffc6c5c5))),
        SizedBox(width: 32),
        Text('Best Collection',
            style: TextStyle(fontSize: 16, color: Color(0xffc6c5c5))),
        SizedBox(width: 32),
      ]),
    );
  }
}
