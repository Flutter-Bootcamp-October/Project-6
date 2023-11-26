import 'package:flutter/material.dart';
import 'package:wach_store_app/screens/filter_screen.dart';

class CustomAppBarWithImage extends StatelessWidget {
  const CustomAppBarWithImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.format_list_bulleted_outlined,
          size: 24,
        ),
        Image.asset(
          'lib/assets/images/appbar_logo.png',
          height: 32,
        ),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FilterScreen()));
          },
          child: Icon(
            Icons.filter_list,
            size: 24,
          ),
        ),
      ],
    );
  }
}
