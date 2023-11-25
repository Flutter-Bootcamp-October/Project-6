import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/bloc/buttom_nav_bloc/bottom_nav_bloc.dart';
import 'package:project_4/bloc/text_field_bloc/text_field_bloc.dart';
import 'package:project_4/data/global_data.dart';
import 'package:project_4/widgets/custom_app_bar.dart';
import 'package:project_4/widgets/custom_button.dart';

import 'widgets/profile_text_field.dart';
import 'widgets/user_avatar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController(text: currentUser.name);

    TextEditingController phoneController = TextEditingController(text: currentUser.mobileNumber);

    TextEditingController emailController = TextEditingController(text: currentUser.email);

    TextEditingController passwordController = TextEditingController(text: currentUser.password);
    return Scaffold(
      appBar: customAppBar(
          title: "My Profile",
          context: context,
          hasAction: false,
          onPressedFunc: () {
            context.read<BottomNavBloc>().add(ChangeIndexEvent(index: 0));
          }),
      body: SingleChildScrollView(
        child: BlocBuilder<TextFieldBloc, TextFieldState>(
          builder: (context, state) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * .65,
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  const Expanded(child: UserAvatar()),
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        ProfileTextField(
                            controller: nameController,
                            label: "Name",
                            isPassword: false,
                            inputType: TextInputType.text),
                        ProfileTextField(
                            controller: phoneController,
                            label: "Mobile Number",
                            isPassword: false,
                            inputType: TextInputType.number),
                        ProfileTextField(
                            controller: emailController,
                            label: "Email Address",
                            isPassword: false,
                            inputType: TextInputType.text),
                        ProfileTextField(
                            controller: passwordController,
                            label: "Password",
                            isPassword: true,
                            inputType: TextInputType.text),
                        CustomButton(
                            content: "Update",
                            hasIcon: false,
                            onPressedFunc: () {
                              checkUpdateInformation(
                                  nameController: nameController,
                                  phoneController: phoneController,
                                  emailController: emailController,
                                  passwordController: passwordController,
                                  context: context);
                            })
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void checkUpdateInformation(
      {required nameController,
      required phoneController,
      required emailController,
      required passwordController,
      required BuildContext context}) {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Please don't leave the field empty")));
    }
    if (nameController.text != currentUser.name) {
      usersList.where((element) {
        if (element.name == currentUser.name) {
          element.name = nameController.text;
        }
        return true;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              "Name has been updated from [${currentUser.name}] to [${nameController.text}]")));
      currentUser.name = nameController.text;
    }
    if (emailController.text != currentUser.email) {
      usersList.where((element) {
        if (element.email == currentUser.email) {
          element.email = emailController.text;
        }
        return true;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              "Email has been updated from [${currentUser.email}] to [${emailController.text}]")));
      currentUser.email = emailController.text;
    }
    if (phoneController.text != currentUser.mobileNumber) {
      usersList.where((element) {
        if (element.mobileNumber == currentUser.mobileNumber) {
          element.mobileNumber = phoneController.text;
        }
        return true;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              "Phone Number has been updated from [${currentUser.mobileNumber}] to [${phoneController.text}]")));
      currentUser.mobileNumber = phoneController.text;
    }
    if (passwordController.text != currentUser.password) {
      usersList.where((element) {
        if (element.password == currentUser.password) {
          element.password = passwordController.text;
        }
        return true;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Password has been updated")));
      currentUser.password = passwordController.text;
    }
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Your information is up-to-date")));
  }
}
