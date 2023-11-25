
import 'package:flutter/material.dart';
import 'package:wach_store_app/widgets/brand_card.dart';

class SearchByBrand extends StatelessWidget {
  const SearchByBrand({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          BrandCard(src: 'lib/assets/images/rolex.png'),
          SizedBox(width: 24),
          BrandCard(src: 'lib/assets/images/cartier.png'),
          SizedBox(width: 24),
          BrandCard(src: 'lib/assets/images/omega.png'),
        ],
      ),
    );
  }
}
