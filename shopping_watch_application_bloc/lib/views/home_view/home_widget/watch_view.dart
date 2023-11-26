import 'package:flutter/material.dart';
import 'package:shopping_watch_application_bloc/Data/global.dart';
import 'package:shopping_watch_application_bloc/views/home_view/home_widget/display_all_watch.dart';

class WatchView extends StatelessWidget {
  const WatchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: listWatch
            .map((item) => DispalyAllWatch(
                  watch: item,
                ))
            .toList(),
      ),
    );
  }
}
