import 'package:flutter/material.dart';
import 'package:watch_store/global/global.dart';
import 'package:watch_store/styles/custom_colors.dart';

class Location extends StatelessWidget {
  const Location({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 280,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    )
                  ]),
              child: Center(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(currentUser.location[0]),
                  Icon(
                    Icons.edit,
                    color: black,
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
