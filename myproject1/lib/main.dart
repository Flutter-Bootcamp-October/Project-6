import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopingpriject/blocs/auth_bloc/auth_bloc.dart';
import 'package:shopingpriject/blocs/bloc_cart/card_shop_bloc.dart';
import 'package:shopingpriject/blocs/theme_bloc/theme_bloc.dart';
import 'package:shopingpriject/blocs/theme_bloc/theme_state.dart';
import 'package:shopingpriject/screens/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CardShopBloc()),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(
            create: (context) =>
                ThemeBlocBloc(sharedPreferences: sharedPreferences)),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBlocBloc, ThemeBlocState>(
      builder: (context, state) {
        if (state is GetThemeState) {
          return MaterialApp(
            theme: state.themeData,
            debugShowCheckedModeBanner: false,
            home: WelcomeScreen(),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
