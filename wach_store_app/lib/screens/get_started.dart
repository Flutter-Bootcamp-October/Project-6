import 'package:flutter/material.dart';
import 'package:wach_store_app/screens/signup_screen.dart';
import 'package:wach_store_app/widgets/edit_button.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'lib/assets/images/get-started-image-2.jpg',
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 100),
            ExpandableCarousel(
              options: CarouselOptions(
                autoPlay: false,
              ),
              items: [1, 2].map((i) {
                return Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Builder(
                    builder: (BuildContext context) {
                      return Column(
                        children: [
                          Text(
                            'Universal Timekepers of the world',
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                fontFamily: 'Crimson'),
                          ),
                          Text(
                            'It is a long establisehd fact a reader will be distracted by the readable content.',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          SizedBox(height: 24),
                        ],
                      );
                    },
                  ),
                );
              }).toList(),
            ),
            // SizedBox(height: 500),
            Spacer(),
            EditButton(
              text: 'Get Started',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ));
              },
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
