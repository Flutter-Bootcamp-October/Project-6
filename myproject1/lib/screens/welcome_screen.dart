import 'package:flutter/material.dart';
import 'package:shopingpriject/custom_profiletextfield.dart/custom_button.dart';
import 'package:shopingpriject/screens/signin_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff000000),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      "Universal Timekepers",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontFamily: "Unna"),
                    ),
                  ),
                  SizedBox(height: 7),
                  Padding(
                    padding: const EdgeInsets.only(right: 90),
                    child: Text(
                      "of the World",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontFamily: "Unna"),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "It is long estabilshed fact that a reader will",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      "be distracted by the readable content.",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  "lib/assets/imges/backgroung_img.jpg",
                  width: 300,
                  height: 350,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: CustomButton(
                          text: "Get Started",
                          buttonColor: Colors.amber,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInScreen(),
                                ));
                          },
                        )),
                  )
                ],
              ),
            ]));
  }
}
