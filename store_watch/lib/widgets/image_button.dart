import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  const ImageButton({super.key});
//10
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        height: 50,
        decoration: const BoxDecoration(
          color: Color(0xfff3f4f4),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            "assets/gmail_icon.png",
            width: 32,
            height: 32,
          ),
          const Text(
            "Sign in with Google",
            style: TextStyle(fontWeight: FontWeight.w400),
          )
        ]),
      ),
    );
  }
}
