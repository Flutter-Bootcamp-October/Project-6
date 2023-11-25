import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/bloc/product_bloc/product_bloc.dart';
import 'package:shopping_app/consts/colors.dart';

// ignore: must_be_immutable
class PriceRange extends StatelessWidget {
  PriceRange({super.key, required this.currentRangeValues});
  RangeValues currentRangeValues;
  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: currentRangeValues,
      max: 10000,
      divisions: 50,
      activeColor: appYellow,
      labels: RangeLabels(
        "\$${currentRangeValues.start.round().toString()}",
        "\$${currentRangeValues.end.round().toString()}",
      ),
      onChanged: (RangeValues values) {
        currentRangeValues = values;
        context
            .read<ProductBloc>()
            .add(ChageRangeEvent(currentRangeValues: currentRangeValues));
      },
    );
  }
}
