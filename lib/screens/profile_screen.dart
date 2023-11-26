import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/blocs/bloc_auth/auth_bloc.dart';
import 'package:shopping_app/blocs/bloc_theme/theme_bloc_bloc.dart';
import 'package:shopping_app/consts/colors.dart';
import 'package:shopping_app/extentions/navigation_extentions.dart';
import 'package:shopping_app/data/global.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/screens/bottom_nav_bar.dart';
import 'package:shopping_app/widgets/button_widget.dart';
import 'package:shopping_app/widgets/textfield_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, required this.product}) : super(key: key);
  final Product product;

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

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeBlocBloc>().add(ChangThemEvent('Light'));
            },
            icon: Icon(Icons.sunny),
          ),
          IconButton(
            onPressed: () {
              context.read<ThemeBlocBloc>().add(ChangThemEvent('dark'));
            },
            icon: Icon(Icons.monochrome_photos),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            context.removeUnitl(
              AppBottomNavBar(product: product),
            );
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Text("My Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            badges.Badge(
              position: badges.BadgePosition.topStart(top: 1, start: 60),
              badgeStyle: badges.BadgeStyle(badgeColor: globalButtonColor),
              badgeContent: const Icon(Icons.camera_alt_outlined),
              child: Image.asset(
                "assets/images/empty_profile.png",
                width: 90,
                height: 90,
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: TextFieldCustom(
                controller: nameController,
                hint: 'Enter Full Name',
                labelText: const Text("Name"),
              ),
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
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is UpdateSuccessedState) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Profile updated successfully!"),
                        backgroundColor: Colors.green,
                      ),
                    );
                  });
                  return const Text("Profile updated successfully!");
                } else if (state is ErrorState) {
                  // Show SnackBar for error message
                  return ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Error: ${state.message}"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    },
                    child: const Text("Show Error"),
                  );
                } else {
                  return ButtonCustom(
                    buttonColor: globalButtonColor,
                    buttonChild: const Text(
                      "Update",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      context.read<AuthBloc>().add(
                            UpdateProfileEvent(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              mobileNumber: mobileController.text,
                            ),
                          );
                    },
                    radius: 10,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
