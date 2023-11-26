import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/bloc/auth_bloc/auth_bloc.dart';
import 'package:project_4/bloc/buttom_nav_bloc/bottom_nav_bloc.dart';
import 'package:project_4/bloc/cart_bloc/cart_bloc.dart';
import 'package:project_4/bloc/filter_bloc/filter_bloc.dart';
import 'package:project_4/bloc/text_field_bloc/text_field_bloc.dart';
import 'package:project_4/data/global_data.dart';

import 'screens/start_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    getUsers();
    getWatches();
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(),
        ),
        BlocProvider<CartBloc>(
          create: (BuildContext context) => CartBloc(),
        ),
        BlocProvider<BottomNavBloc>(
          create: (BuildContext context) => BottomNavBloc(),
        ),
        BlocProvider<TextFieldBloc>(
          create: (BuildContext context) => TextFieldBloc(),
        ),
        BlocProvider<FilterBloc>(
          create: (BuildContext context) => FilterBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: false),
        home: const StartScreen(),
      ),
    );
  }
}
