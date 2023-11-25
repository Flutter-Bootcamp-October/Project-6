import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc/blocs/cart_bloc/bloc/cart_bloc.dart';
import 'package:project_bloc/data/global.dart';
import 'package:project_bloc/widgets/order_widget.dart';

class DisplayOrder extends StatelessWidget {
  const DisplayOrder({super.key});

  @override
  Widget build(BuildContext context) {
    calculateGlobalPric();
    return SizedBox(
      height: 470,
      width: MediaQuery.of(context).size.width,
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onLongPress: () {
                    context
                        .read<CartBloc>()
                        .add(DeleteCartEvent(product: orderProducts[index]));
                  },
                  child: OrderWidget(
                    product: orderProducts[index],
                  ),
                );
              },
              itemCount: orderProducts.length);
        },
      ),
    );
  }
}
