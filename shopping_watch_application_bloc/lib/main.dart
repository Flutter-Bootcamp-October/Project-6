import 'package:flutter/material.dart';
import 'package:shopping_watch_application_bloc/blocs/auth_bloc/auth_bloc.dart';
import 'package:shopping_watch_application_bloc/blocs/card_bloc/cart_bloc.dart';
import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';
import 'package:shopping_watch_application_bloc/views/logo_view/logo_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => CartBloc())
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: false,
          // ignore: deprecated_member_use
          backgroundColor: appColorWhite,
          brightness: Brightness.light,
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: Colors.amber),
              backgroundColor: appColorWhite),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style:
                ElevatedButton.styleFrom(backgroundColor: Colors.purple[300]),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const LogoScreen(),
      ),
    );
  }
}
