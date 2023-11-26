import 'package:flutter/material.dart';
import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';


class RangeSliderFilterScreen extends StatefulWidget {
  const RangeSliderFilterScreen({super.key});

  @override
  State<RangeSliderFilterScreen> createState() =>
      _RangeSliderFilterScreenState();
}

class _RangeSliderFilterScreenState extends State<RangeSliderFilterScreen> {
  RangeValues values = RangeValues(200, 1000);
  @override
  Widget build(BuildContext context) {
    RangeLabels labels =
        RangeLabels(values.start.toString(), values.end.toString());

    return RangeSlider(
        values: values,
        max: 1000,
        min: 200,
        labels: labels,
        activeColor: appColorYellow,
        inactiveColor: appColorColdGrey,
        onChanged: (values) {
          setState(() {
            this.values = values;
          });
        });
  }
}
