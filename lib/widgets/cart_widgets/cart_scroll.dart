import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wach_store_app/BLoCs/cart_bloc/cart_bloc.dart';
import 'package:wach_store_app/BLoCs/cart_bloc/cart_event.dart';
import 'package:wach_store_app/BLoCs/cart_bloc/cart_state.dart';
import 'package:wach_store_app/global/global.dart';
import 'package:wach_store_app/widgets/cart_widgets/cart_product_widget.dart';

class CartScroll extends StatelessWidget {
  const CartScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is DeleteWatchState) {
          return ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: orderProducts.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onLongPress: () {
                  context
                      .read<CartBloc>()
                      .add(DeleteWatchEvent(watch: orderProducts[index]));
                },
                child: CartProdectWidget(watch: orderProducts[index]),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 4);
            },
          );
        } else {
          return ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: orderProducts.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onLongPress: () {
                  context
                      .read<CartBloc>()
                      .add(DeleteWatchEvent(watch: orderProducts[index]));
                },
                child: CartProdectWidget(watch: orderProducts[index]),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 4);
            },
          );
        }
      },
    );
  }
}
