import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/blocs/auth/auth_bloc.dart';
import 'package:project_4/blocs/cart/bloc/cart_bloc.dart';
import 'package:project_4/blocs/obsecure/bloc/obsecure_bloc.dart';
import 'package:project_4/blocs/theme/bloc/theme_bloc.dart';
import 'package:project_4/blocs/theme/bloc/theme_state.dart';
import 'package:project_4/blocs/user/bloc/user_bloc.dart';
import 'package:project_4/screens/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences pref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  pref = await SharedPreferences.getInstance();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => CartBloc()),
        BlocProvider(create: (context) => UserBloc()),
        BlocProvider(create: (context) => ObsecureBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is GetThemeState) {
            return MaterialApp(
              theme: state.themeData,
              debugShowCheckedModeBanner: false,
              home: const SignInScreen(),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
