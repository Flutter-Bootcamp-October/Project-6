import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopingpriject/blocs/bloc/auth_bloc.dart';
import 'package:shopingpriject/blocs/bloc/bloc2/bloc/theme_bloc.dart';
import 'package:shopingpriject/blocs/bloc/bloc2/bloc/theme_state.dart';
import 'package:shopingpriject/blocs/bloc/bloc3/bloc/order_bloc.dart';
import 'package:shopingpriject/blocs/bloc/bloc4/bloc/coupon_bloc.dart';
import 'package:shopingpriject/blocs/bloc/bloc5/bloc/detail_bloc.dart';

import 'package:shopingpriject/screens/welcome_screen.dart';

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
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(create: (context) => OrderBloc()),
        BlocProvider(create: (context) => CouponBloc()),
        BlocProvider(create: (context) => DetailBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is GetThemeState) {
            return MaterialApp(
              theme: state.themeDate,
              home: WelcomeScreen(),
              debugShowCheckedModeBanner: false,
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
