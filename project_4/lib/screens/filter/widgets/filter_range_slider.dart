import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/bloc/filter_bloc/filter_bloc.dart';
import 'package:project_4/data/constants.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterRangeSlider extends StatelessWidget {
  const FilterRangeSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var range = const SfRangeValues(350, 1100);
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        return Column(
          children: [
            SfRangeSlider(
              inactiveColor: const Color.fromARGB(255, 241, 241, 241),
              min: 1,
              max: 2000,
              values: range,
              onChanged: (value) {
                range = SfRangeValues(value.start.round(), value.end.round());
                context.read<FilterBloc>().add(FilterRangeEvent(range: range));
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("$rupeeIcon${range.start}"),
                Text("$rupeeIcon${range.end}"),
              ],
            )
          ],
        );
      },
    );
  }
}
