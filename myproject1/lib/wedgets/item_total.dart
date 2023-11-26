import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopingpriject/blocs/bloc_cart/card_shop_bloc.dart';
import 'package:shopingpriject/data/global.dart';

Padding Total() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Item Total ",
          style: TextStyle(fontSize: 17),
        ),
        BlocBuilder<CardShopBloc, CardShopState>(
          builder: (context, state) {
            print("------------------------------");

            return Text(
              "\$${globalPrice.toString()}",
              style: TextStyle(fontSize: 18),
            );
          },
        )
      ],
    ),
  );
}
