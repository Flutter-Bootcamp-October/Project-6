import 'package:flutter/material.dart';
import 'package:store_watch/screens/signin_screen.dart';
import 'package:store_watch/screens/signup_screen.dart';
import 'package:store_watch/widgets/circle.dart';
import 'package:store_watch/widgets/praimery_button.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});
//1
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background_watch.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 62),
                    const Text(
                      "Universal TimeKepers\nof the World",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontFamily: "NotoSerif"),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "It is a long established fact that a reader will\nbe distracted by the readable content.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.5),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Row(children: [
                      Circle(circleColor: Color(0xfffcc873).withOpacity(0.2)),
                      Circle(circleColor: Color(0xfffcc873).withOpacity(0.2)),
                      Circle(circleColor: Color(0xfffcc873)),
                    ]),
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 390,
                    ),
                    PraimeryButton(
                        buttonTitle: "Get Started",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                          );
                        }),
                  ],
                ),
              ),
            )));
  }
}
