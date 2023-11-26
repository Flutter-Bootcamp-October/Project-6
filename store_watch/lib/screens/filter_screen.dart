import 'package:flutter/material.dart';

import '/screens/product_display_by_sort.dart';
import '/widgets/button_widget.dart';
import '../widgets/category_widget.dart';
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
          backgroundColor: Colors.transparent,
          leading: InkWell(
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(0xff141922),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            "Filter",
            style: TextStyle(color: Color(0xff141922)),
          ),
          actions: [
            InkWell(
              child: const Icon(
                Icons.close,
                color: Color(0xff141922),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
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
                Row(
                  children: [
                    CategortWidget(
                      containerColor: containerType2 == 'All Watches'
                          ? const Color(0xfffcc873)
                          : const Color(0xfff3f3f3),
                      textContainer: 'All Watches',
                      containerWidth: 110,
                      containerHeight: 50,
                      onPressed: () {
                        containerType2 = 'All Watches';
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CategortWidget(
                      containerColor: containerType2 == 'Metallic'
                          ? const Color(0xfffcc873)
                          : const Color(0xfff3f3f3),
                      textContainer: 'Metallic',
                      containerWidth: 100,
                      containerHeight: 50,
                      onPressed: () {
                        containerType2 = 'Metallic';
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CategortWidget(
                      containerColor: containerType2 == 'Leather'
                          ? const Color(0xfffcc873)
                          : const Color(0xfff3f3f3),
                      textContainer: 'Leather',
                      containerWidth: 100,
                      containerHeight: 50,
                      onPressed: () {
                        containerType2 = 'Leather';
                        setState(() {});
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CategortWidget(
                      containerColor: containerType2 == 'Expensive'
                          ? const Color(0xfffcc873)
                          : const Color(0xfff3f3f3),
                      textContainer: 'Expensive',
                      containerWidth: 100,
                      containerHeight: 50,
                      onPressed: () {
                        containerType2 = 'Expensive';
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CategortWidget(
                      containerColor: containerType2 == 'Classical'
                          ? const Color(0xfffcc873)
                          : const Color(0xfff3f3f3),
                      textContainer: 'Classical',
                      containerWidth: 100,
                      containerHeight: 50,
                      onPressed: () {
                        containerType2 = 'Classical';
                        setState(() {});
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const TextTitleWidget(
                  textTitle: 'Sort Watches By',
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    CategortWidget(
                      textContainer: 'Price',
                      containerWidth: 80,
                      containerHeight: 50,
                      containerColor: containerType == 'price'
                          ? const Color(0xfffcc873)
                          : const Color(0xfff3f3f3),
                      onPressed: () {
                        containerType = 'price';
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CategortWidget(
                      containerColor: containerType == 'Rating'
                          ? const Color(0xfffcc873)
                          : const Color(0xfff3f3f3),
                      textContainer: 'Rating',
                      containerWidth: 90,
                      containerHeight: 50,
                      onPressed: () {
                        containerType = 'Rating';
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CategortWidget(
                      containerColor: containerType == 'popular'
                          ? const Color(0xfffcc873)
                          : const Color(0xfff3f3f3),
                      textContainer: 'Popularity',
                      containerWidth: 110,
                      containerHeight: 50,
                      onPressed: () {
                        containerType = 'popular';
                        setState(() {});
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CategortWidget(
                      containerColor: containerType == 'popularity'
                          ? const Color(0xfffcc873)
                          : const Color(0xfff3f3f3),
                      textContainer: 'Top Selling',
                      containerWidth: 120,
                      containerHeight: 50,
                      onPressed: () {
                        containerType = 'popularity';
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CategortWidget(
                      containerColor: containerType == 'Deals & Discounts'
                          ? const Color(0xfffcc873)
                          : const Color(0xfff3f3f3),
                      textContainer: 'Deals & Discounts',
                      containerWidth: 170,
                      containerHeight: 50,
                      onPressed: () {
                        containerType = 'Deals & Discounts';
                        setState(() {});
                      },
                    ),
                  ],
                ),
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
                SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ButtonWidget(
                      textButton: 'Apply',
                      onPressed: () {
                        if (containerType == 'price') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDisplayBySort(
                                    containerType: containerType)),
                          );
                        } else if (containerType == 'popularity') {
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
                      },
                    )),
              ],
            ),
          ),
        ));
  }
}
