import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_watch/blocs/auth_bloc/auth_bloc.dart';
import 'package:store_watch/blocs/detalis_bloc/details_bloc.dart';
import 'package:store_watch/blocs/profile_bloc/profile_bloc.dart';
import 'package:store_watch/blocs/theme_bloc/them_.state.dart';
import 'package:store_watch/blocs/theme_bloc/them_bloc.dart';
import 'package:store_watch/data/global.dart';
import 'package:store_watch/screens/signin_screen.dart';

late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  getProductObjects();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(),
        ),
        BlocProvider(
          create: (context) => DetailBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
        if (state is GetThemeState) {
          return MaterialApp(
            theme: state.themeData,
            debugShowCheckedModeBanner: false,
            home: SignInUp(),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
