import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wach_store_app/blocs/bloc/authentication_bloc.dart';
import 'package:wach_store_app/blocs/bloc_cart/cart_bloc.dart';
import 'package:wach_store_app/blocs/bloc_them/them_bloc.dart';
import 'package:wach_store_app/screens/get_started.dart';

late SharedPreferences prefs;
void main() async {
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
        BlocProvider(create: (BuildContext context) => AuthenticationBloc()),
        BlocProvider(create: (BuildContext context) => CartBloc()),
        BlocProvider(create: (context) => ThemBloc()..add(GetThemeEvent()))
      ],
      child: BlocBuilder<ThemBloc, ThemState>(builder: (context, state) {
        if (state is GetThemeState) {
          return MaterialApp(
            theme: state.themeData,
            home: GetStarted(),
            debugShowCheckedModeBanner: false,
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
