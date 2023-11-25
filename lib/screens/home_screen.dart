import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc/main.dart';
import 'package:project_bloc/widgets/product_display.dart';
import 'package:project_bloc/widgets/top_deals.dart';
import 'package:project_bloc/widgets/type_watch.dart';

import '../blocs/theme_bloc/theme_bloc.dart';
import 'filter_screen.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.light_mode_outlined,
            ),
            onPressed: () {
              prefs?.getString("theme") == 'dark'
                  ? context.read<ThemeBloc>().add(ChangeThemeEvent("light"))
                  : context.read<ThemeBloc>().add(ChangeThemeEvent("dark"));
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo.jpeg",
                cacheHeight: 25,
                cacheWidth: 25,
              ),
              const Text(
                'ADS Watch',
                style:
                    TextStyle(fontFamily: 'Lora', fontWeight: FontWeight.w500),
              ),
            ],
          ),
          centerTitle: true,
          actions: [
            InkWell(
              child: const Icon(Icons.filter_list),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const FilterScreen(),
                ));
              },
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: const SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Hello',
                      style: TextStyle(
                          fontFamily: 'Lora',
                          fontSize: 28,
                          color: Color(0xff233b67),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Choose Your Top Brands',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lora',
                      ),
                    ),
                  ),
                  TypeWatch(),
                  ProductDisplay(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Top Deals",
                          style: TextStyle(
                              fontFamily: 'Lora',
                              fontSize: 22,
                              color: Color(0xff233b67)),
                        ),
                        Text('View All',
                            style: TextStyle(
                              fontSize: 22,
                              color: Color(0xff233b67),
                              fontFamily: 'Lora',
                            ))
                      ],
                    ),
                  ),
                  TopDeals(),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
