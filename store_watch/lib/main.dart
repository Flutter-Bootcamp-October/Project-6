import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_watch/blocs/bloc_Auth/bloc/auth_bloc.dart';
import 'package:store_watch/blocs/bloc_Auth/bloc/bloc/add_to_cart_bloc.dart';
import 'package:store_watch/blocs/bloc_Auth/bloc/bloc/detail_product_bloc.dart';
import 'package:store_watch/blocs/bloc_Auth/bloc/bloc/display_detail_bloc.dart';
import 'package:store_watch/blocs/bloc_Auth/bloc/bloc/filter_bloc.dart';
import 'package:store_watch/blocs/bloc_Auth/bloc/bloc/profile_bloc.dart';
import 'package:store_watch/blocs/bloc_Auth/bloc/bloc/search_product_bloc.dart';
import 'package:store_watch/blocs/bloc_Auth/bloc/bloc/theme_bloc.dart';
import 'package:store_watch/blocs/bloc_Auth/bloc/nav_bloc.dart';
import 'package:store_watch/screens/get_started_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(),
          ),
          BlocProvider(
            create: (context) => NavBloc(),
          ),
          BlocProvider(
            create: (context) => DisplayDetailBloc()..add(GetDataEvent()),
          ),
          BlocProvider(
            create: (context) => SearchProductBloc()..add(SearchEvent()),
          ),
          BlocProvider(
            create: (context) => ProfileBloc(),
          ),
          BlocProvider(create: (context) => FilterBloc()),
          BlocProvider(create: (context) => DetailProductBloc()),
          BlocProvider(create: (context) => AddToCartBloc()),
          BlocProvider(create: (context) => ThemeBloc()),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            if (state is GetThemeState) {
              return MaterialApp(
                  theme: state.themeData,
                  debugShowCheckedModeBanner: false,
                  home: const GetStarted());
            } else {
              return Container();
            }
          },
        ));
  }
}
