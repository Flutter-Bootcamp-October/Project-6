import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopingpriject/blocs/bloc/auth_bloc.dart';
import 'package:shopingpriject/blocs/bloc/auth_event.dart';
import 'package:shopingpriject/blocs/bloc/auth_state.dart';
import 'package:shopingpriject/custom_profiletextfield.dart/custom_button.dart';
import 'package:shopingpriject/data/global.dart';

import 'package:shopingpriject/screens/nav_bar.dart';
import 'package:shopingpriject/screens/setting_Screen.dart';
import 'package:shopingpriject/screens/signup_Screen.dart';
import 'package:shopingpriject/widgets/custom_textfield.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  TextEditingController emailorusernameController = TextEditingController();

  TextEditingController paswwordController = TextEditingController();

  /* void signIn() {
    String usernameOrEmail = emailorusernameController.text;
    String password = paswwordController.text;

    bool isSignInSuccessful = false;

    for (var user in userList) {
      if ((user.email == usernameOrEmail || user.name == usernameOrEmail) &&
          user.password == password) {
        currentUser = user;
        isSignInSuccessful = true;

        break;
      }
    }

    if (isSignInSuccessful) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Sign-in Successful'),
            content: Text('You have successfully signed in!'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NavBar(),
                    ),
                  );
                },
              ),
            ],
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid credentials")),
      );
    }
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()));
            },
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            )),
      ),*/

      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 10,
        ),
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Positioned(
              bottom: 490,
              left: 250,
              child: Container(
                child: Image.asset(
                  "lib/assets/imges/img2.png",
                  width: 200,
                  height: 200,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsScreen()));
                    },
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.black,
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Image.asset(
                    "lib/assets/imges/img 11.png",
                    width: 100,
                    height: 100,
                  ),
                ),
                Text(
                  "Let's Sign in",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: "Unna",
                    color: Colors.blue[900],
                  ),
                ),
                Text(
                  "Fill the details below to continue.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CustomTextField(
                    label: "Username or Email",
                    hint: "Enter Username or Email",
                    icon: Icons.email_outlined,
                    controller: emailorusernameController,
                  ),
                ),
                SizedBox(height: 20),
                CustomTextField(
                  label: "Password",
                  hint: "Enter password",
                  icon: Icons.remove_red_eye_outlined,
                  obscureText: true,
                  controller: paswwordController,
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.blue[800]),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is SignInSuccessedState) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NavBar(),
                            ));
                      } else if (state is ErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)));
                      }
                    },
                    child: CustomButton(
                      text: "Sign in",
                      buttonColor: Colors.amber,
                      onPressed: () {
                        context.read<AuthBloc>().add(SignInEvent(
                            emailorusernameController.text,
                            paswwordController.text));
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Align(alignment: Alignment.bottomCenter, child: Text("OR")),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: CustomButton(
                    text: "Sign in with Google",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                    buttonColor: Color.fromARGB(255, 248, 246, 246),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New to ADS Watch?"),
                    SizedBox(width: 5),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
