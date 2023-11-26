import 'package:flutter/material.dart';
import 'package:wach_store_app/BLoCs/auth_bloc/auth_bloc.dart';
import 'package:wach_store_app/BLoCs/cart_bloc/cart_bloc.dart';
import 'package:wach_store_app/BLoCs/product_bloc/bloc/product_bloc.dart';
import 'package:wach_store_app/BLoCs/profile_bloc/profile_bloc.dart';
import 'package:wach_store_app/BLoCs/search_bloc/search_bloc.dart';
import 'package:wach_store_app/BLoCs/theme_bloc/theme_bloc.dart';
import 'package:wach_store_app/BLoCs/theme_bloc/theme_state.dart';
import 'package:wach_store_app/global/global.dart';
import 'package:wach_store_app/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wach_store_app/screens/get_started.dart';
import 'package:wach_store_app/screens/signin_screen.dart';
import 'package:wach_store_app/theme/app_theme.dart';

void main() {
  userObject = User(name: 'a', email: 'a', password: 'a');
  userList.add(userObject!);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => ProductBloc(),
        ),
        BlocProvider(
          create: (context) => CartBloc(),
        ),
        BlocProvider(
          create: (context) => SearchBloc(),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is GetThemeState) {
            return MaterialApp(
              theme: state.theme,
              home: GetStarted(),
              debugShowCheckedModeBanner: false,
            );
          } else {
            return MaterialApp(
              theme: appTheme['light'],
              home: GetStarted(),
              debugShowCheckedModeBanner: false,
            );
          }
        },
      ),
    );
  }
}
