import 'package:flutter/material.dart';

import 'sign_in_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/watch-start.jpeg'), fit: BoxFit.cover)),
          ),
          Positioned(
            top: 100,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Universal Timekepers',
                      style: TextStyle(
                          color: Colors.white, fontSize: 30, fontFamily: 'PlayfairDisplay')),
                  const Text('of the World',
                      style: TextStyle(
                          color: Colors.white, fontSize: 30, fontFamily: 'PlayfairDisplay')),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'it is a long established fact that a reader will',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Text(
                    'be distracted by the readable content',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Center(
                      child: Padding(
                    padding: EdgeInsets.only(top: 550),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                minimumSize: const Size(400, 50),
                backgroundColor: Colors.amber),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInScreen(),
                  ));
            },
            child: const Text(
              'Get Started',
              style: TextStyle(color: Colors.black),
            )),
      ),
    );
  }
}
