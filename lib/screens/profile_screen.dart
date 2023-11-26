import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wach_store_app/BLoCs/profile_bloc/profile_bloc.dart';
import 'package:wach_store_app/BLoCs/profile_bloc/profile_event.dart';
import 'package:wach_store_app/BLoCs/profile_bloc/profile_state.dart';
import 'package:wach_store_app/BLoCs/theme_bloc/theme_bloc.dart';
import 'package:wach_store_app/BLoCs/theme_bloc/theme_event.dart';
import 'package:wach_store_app/global/global.dart';
import 'package:wach_store_app/widgets/appbar/app_bar.dart';
import 'package:wach_store_app/widgets/appbar/profile_app_bar.dart';
import 'package:wach_store_app/widgets/edit_button.dart';
import 'package:wach_store_app/widgets/profile_widget/profile_textfield_passwerd.dart';
import 'package:wach_store_app/widgets/profile_widget/profile_textfield_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
            TextEditingController(text: userObject?.name),
        emailController = TextEditingController(text: userObject?.email),
        mobileController = TextEditingController(text: userObject?.mobile),
        paswwordController = TextEditingController(text: userObject?.password);
    return Scaffold(
      appBar: profileAppbar(context, 'My Profile'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Stack(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'lib/assets/images/OIP.jpg',
                        width: 90,
                        height: 90,
                      ),
                    ),
                    Positioned(
                      bottom: 70,
                      left: 60,
                      child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: const Color(0xfffbcf7a),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            size: 20,
                          )),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 38,
              ),
              ProfileTextField(
                lable: 'Name',
                Controller: nameController,
              ),
              const SizedBox(
                height: 20,
              ),
              ProfileTextField(
                lable: 'Mobile Number',
                Controller: mobileController,
              ),
              const SizedBox(
                height: 20,
              ),
              ProfileTextField(
                lable: 'Email Address',
                Controller: emailController,
              ),
              const SizedBox(
                height: 20,
              ),
              ProfileTextFieldPasswerd(
                lable: 'Passwerd',
                Controller: paswwordController,
              ),
              const SizedBox(
                height: 20,
              ),
              BlocListener<ProfileBloc, ProfileState>(
                listener: (context, state) {
                  if (state is EditSuccessState) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Information updated successfuly')));
                  } else if (state is EditErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Name, emeil password are requierd')));
                  }
                },
                child: EditButton(
                  text: 'Update',
                  onTap: () {
                    context.read<ProfileBloc>().add(EditProfileEvent(
                        name: nameController.text,
                        email: emailController.text,
                        mobile: mobileController.text,
                        password: paswwordController.text));
                  },
                ),
              ),
              SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
