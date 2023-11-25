import 'package:flutter/material.dart';
import 'package:wach_store_app/dataset/wach_dataset.dart';
import 'package:wach_store_app/global/global.dart';
import 'package:wach_store_app/models/wach_model.dart';
import 'package:wach_store_app/widgets/item_card.dart';

class TopBrandsCard extends StatefulWidget {
  const TopBrandsCard({
    super.key,
  });

  @override
  State<TopBrandsCard> createState() => _TopBrandsCardState();
}

class _TopBrandsCardState extends State<TopBrandsCard> {
  @override
  void initState() {
    WachProductList.clear();
    for (var element in WachDataSet) {
      WachProductList.add(WatchProduct.fromJson(element));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
