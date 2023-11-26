import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/blocs/theme/bloc/theme_bloc.dart';
import 'package:project_4/blocs/theme/bloc/theme_event.dart';
import 'package:project_4/data/global_data.dart';
import 'package:project_4/data/watch_data_set.dart';
import 'package:project_4/models/watch_model.dart';

import 'components/app_bar_widget.dart';
import 'components/category_component.dart';
import 'components/product_list_widget.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  getData() {
    if (watchesList.isEmpty) {
      for (var element in watches) {
        watchesList.add(Watch.fromJson(element));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: homeAppBarWidget(context: context),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "Hello",
                  style: TextStyle(
                      fontSize: 28,
                      color: Color(0xff294475),
                      fontFamily: 'DMSerifText'),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    context
                        .read<ThemeBloc>()
                        .add(ChangeThemeEvent(themeText: "light"));
                  },
                  icon: const Icon(
                    Icons.sunny,
                    color: Colors.amber,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context
                        .read<ThemeBloc>()
                        .add(ChangeThemeEvent(themeText: "dark"));
                  },
                  icon: const Icon(
                    Icons.nightlight_round_outlined,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            const Text(
              "Choose Your Top Brands",
              style: TextStyle(fontSize: 23, fontFamily: 'DMSerifText'),
            ),
            const SizedBox(
              height: 20,
            ),
            const CategoryWidget(),
            const SizedBox(
              height: 10,
            ),
            const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ProductListWidget(),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
