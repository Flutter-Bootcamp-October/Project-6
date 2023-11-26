import 'package:flutter/material.dart';
import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';
import 'package:url_launcher/url_launcher.dart';

class GoogleSignInButtom extends StatelessWidget {
  const GoogleSignInButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () async {
          Uri url = Uri.parse("https://google.com/");
          try {
            await launchUrl(url);
          } catch (error) {}
        },
        child: Container(
          height: 50,
          width: 350,
          decoration: BoxDecoration(
            color: appColorColdGrey,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ClipOval(
                  child: SizedBox(
                    height: 33,
                    width: 33,
                    child: Image.asset(
                      "assets/google_logo.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 55),
                child: Text(
                  "Sign in with Google",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
