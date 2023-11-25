import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wach_store_app/blocs/bloc_cart/cart_bloc.dart';
import 'package:wach_store_app/blocs/bloc_cart/cart_event.dart';
import 'package:wach_store_app/blocs/bloc_cart/cart_state.dart';
import 'package:wach_store_app/widgets/cart_widgets/cart_product_widget.dart';

class CartScroll extends StatelessWidget {
  const CartScroll({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartUpdatedState) {
          return ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onLongPress: () {
                  context
                      .read<CartBloc>()
                      .add(RemoveFromCartEvent(state.cartProducts[index]));
                },
                child: CartProdectWidget(watch: state.cartProducts[index]),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 4,
              );
            },
            itemCount: state.cartProducts.length,
          );
        }
        return Container();
      },
    );
  }
}
