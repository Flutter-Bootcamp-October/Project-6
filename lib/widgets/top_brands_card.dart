import 'package:flutter/material.dart';
import 'package:wach_store_app/global/global.dart';
import 'package:wach_store_app/widgets/item_card.dart';

class TopBrandsCard extends StatelessWidget {
  const TopBrandsCard({super.key});

  @override
  Widget build(BuildContext context) {
    WachProductList.clear();
    loadProducts();
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return ItemCard(watch: WachProductList[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 4,
        );
      },
      itemCount: WachProductList.length,
    );
  }
}
