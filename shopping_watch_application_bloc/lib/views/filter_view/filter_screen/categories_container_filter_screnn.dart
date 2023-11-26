import 'package:flutter/material.dart';
import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';

class CategoriesContainerFilterScreen extends StatefulWidget {
  const CategoriesContainerFilterScreen({super.key});

  @override
  State<CategoriesContainerFilterScreen> createState() =>
      _CategoriesContainerFilterScreenState();
}

class _CategoriesContainerFilterScreenState
    extends State<CategoriesContainerFilterScreen> {
  List<String> categoriesList = [
    'All Watches',
    'Metallic',
    'Leather',
    'Expensive',
    'Classical'
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: GridView.builder(
        itemCount: categoriesList.length,
        itemBuilder: (BuildContext context, int index) {
          return choice(index);
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          childAspectRatio: 2,
          crossAxisCount: 3,
        ),
      ),
    );
  }

  choice(int index) {
    return ChoiceChip(
      label: Container(
        height: 50,
        width: 120,
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
