import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wach_store_app/BLoCs/theme_bloc/theme_bloc.dart';
import 'package:wach_store_app/BLoCs/theme_bloc/theme_event.dart';

IconData? icon;
IconData? icon2;
String? title;

profileAppbar(
  BuildContext context,
  title,
) {
  return AppBar(
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
      onPressed: () {},
    ),
    centerTitle: true,
    title: Text(
      title!,
      style: TextStyle(color: Colors.black, fontFamily: 'Crimson'),
    ),
    actions: [
      IconButton(
        icon: Icon(Icons.light_mode, color: Colors.amber[900]),
        onPressed: () {
          context.read<ThemeBloc>().add(ChangeThemeEvent(theme: 'light'));
        },
      ),
      IconButton(
        icon: Icon(Icons.dark_mode, color: Colors.purple[800]),
        onPressed: () {
          context.read<ThemeBloc>().add(ChangeThemeEvent(theme: 'dark'));
        },
      ),
    ],
  );
}
