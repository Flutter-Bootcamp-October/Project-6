import 'package:flutter/material.dart';

import 'package:store_watch/widgets/type_watch_widget.dart';

class TypeWatch extends StatelessWidget {
  const TypeWatch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return const TypeWatchWidget();
        },
      ),
    );
  }
}