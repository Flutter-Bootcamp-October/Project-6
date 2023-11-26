import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watch_store/blocs/auth_bloc/auth_bloc.dart';
import 'package:watch_store/blocs/chip_bloc/chip_bloc.dart';
import 'package:watch_store/blocs/product_bloc/product_bloc.dart';
import 'package:watch_store/blocs/search_bloc/search_bloc.dart';
import 'package:watch_store/blocs/theme_bloc/theme_bloc.dart';
import 'package:watch_store/global/global.dart';
import 'package:watch_store/screens/main_app_screens/onboarding.dart';

late SharedPreferences? prefs;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  getProductObjects();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(),
          ),
          BlocProvider(
            create: (context) => ProductBloc(),
          ),
          BlocProvider(
            create: (context) => ChipBloc(),
          ),
          BlocProvider(
            create: (context) => SearchBloc(),
          ),
          BlocProvider(create: (context) => ThemeBloc()..add(GetThemeEvent()))
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            if (state is GetThemeState) {
              return MaterialApp(
                theme: state.themeData,
                debugShowCheckedModeBanner: false,
                home: const OnboardingScreen(),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
