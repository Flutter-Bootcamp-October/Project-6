import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/blocs/bloc_auth/auth_bloc.dart';
import 'package:shopping_app/blocs/bloc_card_shop/card_shop_bloc.dart';
import 'package:shopping_app/blocs/bloc_theme/theme_bloc_bloc.dart';
import 'package:shopping_app/blocs/search_bloc/search_bloc.dart';
import 'package:shopping_app/data/global.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/screens/search_screen.dart';
import 'package:shopping_app/screens/signup_screen.dart';
import 'package:shopping_app/screens/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Product product = getProduct();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getProductObjects();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CardShopBloc()),
        BlocProvider(
            create: (context) =>
                ThemeBlocBloc(sharedPreferences: sharedPreferences)),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(
          create: (context) => SearchBloc(),
          child: SearchScreen(product: product),
        )
      ],
      child: MainApp(product: product),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBlocBloc, ThemeBlocState>(
      builder: (context, state) {
        if (state is GetThemeState) {
          return MaterialApp(
            theme: state.themeData,
            debugShowCheckedModeBanner: false,
            home: WelcomeScreen(
              product: product,
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

Product getProduct() {
  return Product(
    name: '',
    description: '',
    price: 0,
    category: WatchCategory.metallic,
    image: '',
    rating: 0,
    discount: 0,
  );
}
