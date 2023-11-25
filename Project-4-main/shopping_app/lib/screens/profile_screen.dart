import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/bloc/Theme/theme_bloc.dart';
import 'package:shopping_app/bloc/auth/auth_bloc.dart';
import 'package:shopping_app/bloc/auth/auth_event.dart';
import 'package:shopping_app/bloc/auth/auth_state.dart';
import 'package:shopping_app/consts/colors.dart';
import 'package:shopping_app/extentions/navigation_extentions.dart';
import 'package:shopping_app/global/global.dart';
import 'package:shopping_app/screens/bottom_nav_bar.dart';
import 'package:shopping_app/widgets/button_widget.dart';
import 'package:shopping_app/widgets/textfield_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController =
        TextEditingController(text: currentUser.email);
    TextEditingController passwordController =
        TextEditingController(text: currentUser.password);
    TextEditingController nameController =
        TextEditingController(text: currentUser.fullName);
    TextEditingController mobileController =
        TextEditingController(text: currentUser.mobileNumber);
    IconData mode = Icons.nightlight_outlined;
    String theme = "dark";
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              context.removeUnitl(const AppBottomNavBar());
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: const Text("My Profile"),
        actions: [
          IconButton(onPressed: () {
            context
                .read<ThemeBloc>()
                .add(ChangeThemeEvent(theme: theme, icon: mode));
          }, icon: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              if (state is ChangedThemeState) {
                mode = state.icon;
                theme = state.themeText;
              }
              return Icon(mode);
            },
          ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              badges.Badge(
                  position: badges.BadgePosition.topStart(top: 1, start: 60),
                  badgeStyle:
                      const badges.BadgeStyle(badgeColor: globalButtonColor),
                  badgeContent: const Icon(Icons.camera_alt_outlined),
                  child: Image.asset(currentUser.imagePath,
                      width: 90, height: 90)),
              const SizedBox(height: 40),
              TextFieldCustom(
                controller: nameController,
                hint: 'Enter Full Name',
                labelText: const Text("Name"),
              ),
              const SizedBox(height: 30),
              TextFieldCustom(
                controller: mobileController,
                hint: 'Enter mobile number',
                labelText: const Text("Mobile Number"),
              ),
              const SizedBox(height: 30),
              TextFieldCustom(
                controller: emailController,
                hint: 'Enter Email Address',
                labelText: const Text("Email Address"),
              ),
              const SizedBox(height: 30),
              TextFieldCustom(
                controller: passwordController,
                isPassword: true,
                hint: 'Enter Password',
                labelText: const Text("Password"),
                icon: const Icon(Icons.remove_red_eye_outlined),
              ),
              const SizedBox(height: 30),
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthErrorState) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.message)));
                  }
                  if (state is UpdateSuccessState) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AlertDialog(
                          title: Text('Updated successfuly!'),
                        );
                      },
                    );
                  }
                },
                child: ButtonCustom(
                  buttonChild: const Text(
                    "Update",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    context.read<AuthBloc>().add(UpdateProfileEvent(
                        name: nameController.text.trim(),
                        phone: mobileController.text.trim(),
                        email: emailController.text.trim(),
                        password: passwordController.text.trim()));
                  },
                  radius: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
