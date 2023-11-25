import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_bloc/bloc/cart_bloc.dart';
import '../widgets/filter_category.dart';
import '../widgets/sort_watch.dart';
import '/screens/product_display_by_sort.dart';
import '../widgets/text_title_widget.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _MyWidgetState();
}

RangeValues _rangeSliderDiscreteValues = const RangeValues(40, 80);

class _MyWidgetState extends State<FilterScreen> {
  String containerType = '';

  String containerType2 = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Filter",
          ),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: TextTitleWidget(
                    textTitle: 'Select Categories',
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                const FilterCategory(),
                const SizedBox(
                  height: 30,
                ),
                const TextTitleWidget(
                  textTitle: 'Sort Watches By',
                ),
                const SizedBox(
                  height: 18,
                ),
                const SortWatch(),
                const SizedBox(
                  height: 30,
                ),
                const TextTitleWidget(
                  textTitle: 'Select a Price Range',
                ),
                const SizedBox(
                  height: 18,
                ),
                RangeSlider(
                  values: _rangeSliderDiscreteValues,
                  activeColor: const Color(0xfffcc873),
                  inactiveColor: const Color(0xffe5e4e4),
                  min: 0,
                  max: 100,
                  divisions: 8,
                  labels: RangeLabels('${_rangeSliderDiscreteValues.start}',
                      '${_rangeSliderDiscreteValues.end}'),
                  onChanged: (values) {
                    setState(() {
                      _rangeSliderDiscreteValues = values;
                    });
                  },
                ),
                const Spacer(),
                BlocListener<CartBloc, CartState>(
                  listener: (context, state) {
                    if (state is SortCartState) {
                      if (state.value == 'price') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDisplayBySort(
                                  containerType: containerType)),
                        );
                      } else if (state.value == 'popularity') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDisplayBySort(
                                  containerType: containerType)),
                        );
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                content: Text(
                                    "Please choose the sorting you prefer"),
                              );
                            });
                      }
                    }
                  },
                  child: const SizedBox(),
                ),
              ],
            ),
          ),
        ));
  }
}
