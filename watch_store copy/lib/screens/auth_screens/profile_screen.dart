import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/blocs/auth_bloc/auth_bloc.dart';
import 'package:watch_store/global/global.dart';
import 'package:watch_store/styles/custom_colors.dart';
import 'package:watch_store/widgets/add_text_field.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController =
        TextEditingController(text: currentUser.email);
    TextEditingController passwordController =
        TextEditingController(text: currentUser.password);
    TextEditingController nameController =
        TextEditingController(text: currentUser.name);
    TextEditingController phoneController =
        TextEditingController(text: currentUser.phone);

    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.only(top: 130),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 130.0),
                child: SizedBox(
                    height: 100,
                    width: 100,
                    child: badges.Badge(
                      badgeContent: const Icon(Icons.camera_alt_outlined),
                      badgeStyle: badges.BadgeStyle(badgeColor: primary),
                      child: Image.asset(
                          "assets/1dc9b566-4d8a-4bff-b60c-f30d8cb3011a.jpg"),
                    )),
              ),
              const SizedBox(
                height: 60,
              ),
              AddTextField(
                label: 'Full Name',
                hint: 'Enter name here',
                isPassword: false,
                controller: emailController,
                icon: Icons.mail_outline,
              ),
              const SizedBox(
                height: 30,
              ),
              AddTextField(
                label: 'Mobile Number',
                hint: 'Enter mobile number',
                isPassword: false,
                controller: phoneController,
                icon: Icons.local_phone_outlined,
              ),
              const SizedBox(
                height: 30,
              ),
              AddTextField(
                label: 'Username Or Email',
                hint: 'Enter Username Or Email',
                isPassword: false,
                controller: nameController,
                icon: Icons.person_2_outlined,
              ),
              const SizedBox(
                height: 30,
              ),
              AddTextField(
                label: 'Password',
                hint: 'Enter Password',
                isPassword: true,
                controller: passwordController,
                icon: Icons.remove_red_eye_outlined,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is UpdateProfileState) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.massege)));
                    }
                    if (state is ErrorState) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.massege)));
                    }
                  },
                  child: InkWell(
                    onTap: () {
                      context.read<AuthBloc>().add(UpdateProfileEvent(
                          nameController.text,
                          emailController.text,
                          passwordController.text,
                          phoneController.text));
                    },
                    child: Container(
                      width: 330,
                      height: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xfffcc873)),
                      child: const Center(
                        child: Text(
                          "Update",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
