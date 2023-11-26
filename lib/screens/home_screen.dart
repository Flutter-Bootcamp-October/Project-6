import 'package:flutter/material.dart';
import 'package:wach_store_app/global/global.dart';
import 'package:wach_store_app/widgets/appbar/appbar_with_image.dart';
import 'package:wach_store_app/widgets/blue_bold_text.dart';
import 'package:wach_store_app/widgets/category.dart';
import 'package:wach_store_app/widgets/choose_top_brands.dart';
import 'package:wach_store_app/widgets/featured_product_card.dart';
import 'package:wach_store_app/widgets/home_division.dart';
import 'package:wach_store_app/widgets/search_by_brand.dart';
import 'package:wach_store_app/widgets/top_brands_card.dart';
import 'package:wach_store_app/widgets/top_deal_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWithImage(
          context, true, Icons.filter_list_outlined, 'My Profile', () {}),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              BlueBoldText(
                text: 'Hello',
                size: 40,
              ),
              ChooseTopBrands(),
              SizedBox(height: 40),
              Category(),
              SizedBox(height: 32),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: 375,
                child: TopBrandsCard(),
              ),
              SizedBox(height: 40),
              HomeDivision(title: 'Top Deals'),
              SizedBox(height: 24),
              TopDealCard(),
              SizedBox(height: 40),
              HomeDivision(title: 'Search By Brand'),
              SizedBox(height: 24),
              SearchByBrand(),
              SizedBox(height: 40),
              HomeDivision(title: 'Featured Products'),
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(16),
                crossAxisCount: 2,
                childAspectRatio: 9 / 16,
                children: WachProductList.map((item) => FeaturedProductCard(
                      watch: item,
                    )).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
