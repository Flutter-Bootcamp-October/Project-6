import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc/blocs/search_bloc/search_bloc.dart';
import 'package:project_bloc/data/global.dart';
import 'package:project_bloc/widgets/praimery_button.dart';
import 'package:project_bloc/widgets/profile_text_filed.dart';
import 'package:badges/badges.dart' as badges;

//3
class Profile extends StatelessWidget {
  Profile({super.key});

  final nameContrler = TextEditingController(text: currentCustomer.name);

  final mobileContrler = TextEditingController();

  final emailContrler = TextEditingController(text: currentCustomer.email);

  final passwordContrler =
      TextEditingController(text: currentCustomer.password);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const Icon(
          Icons.keyboard_arrow_left_rounded,
          size: 32,
        ),
        centerTitle: true,
        title: const Text(
          "My Profile",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 32),
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
              BlocListener<SearchBloc, SearchState>(
                listener: (context, state) {
                  if (state is SuccessesState) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.msg),
                        backgroundColor: const Color(0xff85e62c),
                        padding: const EdgeInsets.only(top: 32, left: 16)));
                  } else if (state is ErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          state.msg,
                        ),
                        backgroundColor: const Color(0xffff8989),
                        padding: const EdgeInsets.only(top: 32, left: 16)));
                  }
                },
                child: PraimeryButton(
                    buttonTitle: "Update",
                    onPressed: () {
                      context.read<SearchBloc>().add(UpdateProfileEvent(
                          nameContrler.text,
                          mobileContrler.text,
                          emailContrler.text,
                          passwordContrler.text));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
