import 'package:flutter/material.dart';
import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';
import 'package:shopping_watch_application_bloc/views/filter_view/filter_sort_screen.dart';

class SortContainerFilterScreen extends StatefulWidget {
  const SortContainerFilterScreen({super.key});

  @override
  State<SortContainerFilterScreen> createState() =>
      _SortContainerFilterScreenState();
}

class _SortContainerFilterScreenState extends State<SortContainerFilterScreen> {
  List<String> categoriesList = [
    'Price',
    'Rating',
    'Popularity',
    'Top Selling',
    'Deals&Discounts'
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: 800,
      child: GridView.builder(
        itemCount: categoriesList.length,
        itemBuilder: (BuildContext context, int index) {
          return choice(index);
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2,
          crossAxisCount: 3,
        ),
      ),
    );
  }

  choice(int index) {
    return ChoiceChip(
      label: InkWell(
        onTap: () {
          if (categoriesList[index] == "Price") {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                context: context,
                builder: (builder) {
                  return SizedBox(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (builder) {
                                return const FilterSortScreen();
                              }));
                            },
                            child: const Text(
                              "From High Prices",
                              style: TextStyle(
                                  fontFamily: 'PlayfairDisplay',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  color: appColorBlue),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (builder) {
                                return const FilterSortScreen();
                              }));
                            },
                            child: const Text(
                              "From Low Prices",
                              style: TextStyle(
                                  fontFamily: 'PlayfairDisplay',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  color: appColorBlue),
                            ))
                      ],
                    ),
                  );
                });
          }
        },
        child: Container(
          height: 50,
          width: 140,
          decoration: BoxDecoration(
              color: selectedIndex == index ? appColorYellow : appColorColdGrey,
              borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Text(
              categoriesList[index],
              style: const TextStyle(color: appColorBlue),
            ),
          ),
        ),
      ),
      selected: selectedIndex == index,
      selectedColor: appColorWhite,
      backgroundColor: appColorWhite,
      onSelected: (value) {
        setState(() {
          selectedIndex = index;
        });
      },
    );
  }
}
