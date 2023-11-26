import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/bloc/auth_bloc/auth.bloc.dart';
import 'package:shopping_app/bloc/checkout_bloc/checkout_bloc.dart';
import 'package:shopping_app/bloc/counter_bloc/counter_bloc.dart';
import 'package:shopping_app/bloc/nav_bloc/nav_bloc.dart';
import 'package:shopping_app/screens/welcome_screen.dart';

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
        BlocProvider(create: (context) => NavBloc()),
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => CheckoutBloc()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen(),
      ),
    );
  }
}
