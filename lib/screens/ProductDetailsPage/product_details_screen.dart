import 'package:flutter/material.dart';
import 'package:project_6/models/watch_model.dart';
import 'package:project_6/widgets/custom_button.dart';
import 'components/details_page_main_widget.dart';
import 'components/details_screen_app_bar.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.watch});

  final Watch watch;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomButton(
        onPressedFunc: () {},
        content: "Add to Cart",
        hasIcon: true,
      ),
      appBar: detailsScreenAppBar(),
      body: DetailsPageMainWidget(watch: widget.watch),
    );
  }
}
