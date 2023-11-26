import 'package:flutter/material.dart';
import 'package:shopping_watch_application_bloc/utils/layout/layout_constant.dart';

class ShoppingCategories extends StatefulWidget {
  const ShoppingCategories({super.key});

  @override
  State<ShoppingCategories> createState() => _ShoppingCategoriesState();
}

class _ShoppingCategoriesState extends State<ShoppingCategories> {
  List<String> shoppingCategoriesList = [
    'Trending',
    'Popular',
    'New',
    'Best Collection'
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 10),
      child: SizedBox(
        height: 50,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: shoppingCategoriesList.length,
          itemBuilder: (context, index) {
            return choice(index);
          },
          separatorBuilder: (context, index) => const SizedBox(
            width: 8,
          ),
        ),
      ),
    );
  }

  choice(int index) {
    return ChoiceChip(
      label: Text(
        shoppingCategoriesList[index],
        style: TextStyle(
            color: selectedIndex == index ? appColorBlue : appColorGrey),
      ),
      selected: selectedIndex == index,
      selectedColor: appColorYellow,
      backgroundColor: appColorWhite,
      onSelected: (value) {
        setState(() {
          selectedIndex = index;
        });
      },
    );
  }
}
