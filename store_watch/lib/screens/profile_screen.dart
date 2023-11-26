import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_watch/blocs/profile_bloc/profile_bloc.dart';
import 'package:store_watch/blocs/profile_bloc/profile_event.dart';
import 'package:store_watch/blocs/profile_bloc/profile_state.dart';
import 'package:store_watch/data/global.dart';
import 'package:store_watch/widgets/praimery_button.dart';
import 'package:store_watch/widgets/profile_text_filed.dart';
import 'package:badges/badges.dart' as badges;

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  Profile({super.key});

  TextEditingController nameContrler =
      TextEditingController(text: currentCustomer.name);

  TextEditingController mobileContrler = TextEditingController();

  TextEditingController emailContrler =
      TextEditingController(text: currentCustomer.email);

  TextEditingController passwordContrler =
      TextEditingController(text: currentCustomer.password);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 32),
                child: badges.Badge(
                  badgeAnimation: const badges.BadgeAnimation.fade(),
                  badgeStyle: const badges.BadgeStyle(
                    badgeColor: Color(0xfffcc873),
                  ),
                  badgeContent: const Icon(Icons.photo_camera_outlined),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/profile_image.jpeg",
                      width: 100,
                    ),
                  ),
                ),
              ),
            ),
            ProfileTextFiled(
              hint: 'Name',
              labelText: 'Name',
              isPassword: false,
              controller: nameContrler,
            ),
            ProfileTextFiled(
              hint: 'Mobile Number',
              labelText: 'Mobile Number',
              isPassword: false,
              controller: mobileContrler,
            ),
            ProfileTextFiled(
              hint: 'Email Address',
              labelText: 'Email Address',
              isPassword: false,
              controller: emailContrler,
            ),
            ProfileTextFiled(
              hint: 'Password',
              labelText: 'Password',
              isPassword: true,
              icon: Icons.lock_outlined,
              controller: passwordContrler,
            ),
            const SizedBox(
              height: 8,
            ),
            BlocListener<ProfileBloc, ProfileState>(
              listener: (context, state) {
                if (state is SuccessState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      state.successMessage,
                    ),
                    backgroundColor: Color(0xff85e62c),
                    padding: EdgeInsets.only(top: 32, left: 16),
                  ));
                } else if (state is ErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        state.errorMessage,
                      ),
                      backgroundColor: Color(0xffff8989),
                      padding: EdgeInsets.only(top: 32, left: 16)));
                }
              },
              child: PraimeryButton(
                  buttonTitle: "Update",
                  onPressed: () {
                    context.read<ProfileBloc>().add(ProfileEvent(
                        name: nameContrler.text,
                        mobileNumber: mobileContrler.text,
                        email: emailContrler.text,
                        password: passwordContrler.text));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
