import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_bloc/blocs/auth_bloc/bloc/auth_bloc.dart';
import 'package:project_bloc/blocs/cart_bloc/bloc/cart_bloc.dart';
import 'package:project_bloc/blocs/navi_bloc/navi_bloc.dart';
import 'package:project_bloc/blocs/search_bloc/search_bloc.dart';
import 'package:project_bloc/blocs/theme_bloc/theme_bloc.dart';
import 'package:project_bloc/screens/signup_screen.dart';
import 'helper/observer.dart';

SharedPreferences? prefs;

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NaviBloc()),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => CartBloc(),
        ),
        BlocProvider(
          create: (context) => SearchBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is ThemeInitial) {
            return MaterialApp(
              theme: state.themeData,
              debugShowCheckedModeBanner: false,
              home: SignUp(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
