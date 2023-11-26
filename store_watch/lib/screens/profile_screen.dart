import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_watch/blocs/bloc_Auth/bloc/bloc/profile_bloc.dart';
import 'package:store_watch/blocs/bloc_Auth/bloc/bloc/theme_bloc.dart';
import 'package:store_watch/data/global.dart';
import 'package:store_watch/widgets/praimery_button.dart';
import 'package:store_watch/widgets/profile_text_filed.dart';

//3
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(
          Icons.keyboard_arrow_left_rounded,
          color: Colors.black,
          size: 32,
        ),
        title: const Text(
          "My Profile",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        context
                            .read<ThemeBloc>()
                            .add(ChangeThemeEvent(themeText: 'light'));
                      },
                      icon: const Icon(
                        Icons.sunny,
                        color: Colors.amber,
                        size: 20,
                      )),
                  IconButton(
                      onPressed: () {
                        context
                            .read<ThemeBloc>()
                            .add(ChangeThemeEvent(themeText: 'dark'));
                      },
                      icon: const Icon(
                        Icons.nightlight,
                        color: Colors.blue,
                        size: 20,
                      )),
                ],
              ),
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
                height: 24,
              ),
              BlocListener<ProfileBloc, ProfileState>(
                listener: (context, state) {
                  if (state is UpdateState) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          state.messageSuccssed,
                        ),
                        backgroundColor: const Color(0xff85e62c),
                        padding: const EdgeInsets.only(top: 32, left: 16)));
                  } else if (state is ErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          state.message,
                        ),
                        backgroundColor: const Color(0xffff8989),
                        padding: const EdgeInsets.only(top: 32, left: 16)));
                  }
                },
                child: PraimeryButton(
                    buttonTitle: "Update",
                    onPressed: () {
                      context.read<ProfileBloc>().add(UpdateEvent(
                          name: nameContrler.text,
                          number: mobileContrler.text,
                          email: emailContrler.text,
                          pass: passwordContrler.text));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
