import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wach_store_app/blocs/bloc_cart/cart_bloc.dart';
import 'package:wach_store_app/blocs/bloc_cart/cart_state.dart';
import 'package:wach_store_app/dataset/wach_dataset.dart';
import 'package:wach_store_app/global/global.dart';
import 'package:wach_store_app/widgets/appbar/app_bar.dart';
import 'package:wach_store_app/widgets/cart_widgets/cart_scroll.dart';
import 'package:wach_store_app/widgets/cart_widgets/data_details_section.dart';
import 'package:wach_store_app/widgets/edit_button.dart';
import 'package:wach_store_app/models/wach_model.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    WachProductList = [];
    for (var wach in WachDataSet) {
      WachProductList.add(WatchProduct.fromJson(wach));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, true, Icons.close, 'My Order', () {
        Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is CartUpdatedState) {
                    return CartScroll();
                  }
                  return Container();
                },
              ),
              const DataDetailsSection(
                title: 'Item Total',
                price: '\$10,849.00',
                textColor: true,
              ),
              const SizedBox(
                height: 12,
              ),
              const DataDetailsSection(
                title: 'Discount',
                price: '\$849.00',
                textColor: true,
              ),
              const SizedBox(
                height: 12,
              ),
              const DataDetailsSection(
                title: 'Delivery Free',
                textColor: false,
                price: 'Free',
              ),
              const SizedBox(
                height: 12,
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(
                height: 12,
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is CartUpdatedState) {
                    return DataDetailsSection(
                      title: 'Grand Total',
                      textColor: true,
                      isGrandtotal: true,
                      price: '\$${state.grandTotal.toStringAsFixed(2)}',
                    );
                  }

                  return Container();
                },
              ),
              EditButton(text: 'Checkout', onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
