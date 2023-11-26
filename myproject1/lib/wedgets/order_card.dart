import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopingpriject/blocs/bloc_cart/card_shop_bloc.dart';
import 'package:shopingpriject/models/product_model.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 90,
            height: 100,
            color: Color(0xfff9f7f8),
            child: Image.asset(product.image),
          ),
        ),
        Column(
          children: [
            Text(
              product.name,
              style: TextStyle(
                  color: Color(
                    0xff293a5b,
                  ),
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Container(
                width: 150,
                height: 50,
                child: Text(
                  product.description,
                  style: TextStyle(color: Color(0xffa7a5a6)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 100, top: 5),
              child: Text(
                product.price,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: InkWell(
                  onTap: () {
                    context
                        .read<CardShopBloc>()
                        .add(DecreaseTheCounter(product));
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      color: Color(0xfffcc874),
                    ),
                    child: Icon(Icons.remove),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, top: 5, bottom: 5),
              child: BlocBuilder<CardShopBloc, CardShopState>(
                builder: (context, state) {
                  return Text(
                    product.count.toString(),
                    style: TextStyle(fontSize: 17),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: InkWell(
                  onTap: () {
                    context
                        .read<CardShopBloc>()
                        .add(IncreaseTheCounter(product));
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      color: Color(0xfffcc874),
                    ),
                    child: Icon(Icons.add),
                  )),
            ),
          ],
        )
      ],
    );
  }
}
