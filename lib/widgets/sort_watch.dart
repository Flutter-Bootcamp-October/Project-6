import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_bloc/bloc/cart_bloc.dart';
import 'category_widget.dart';

class SortWatch extends StatelessWidget {
  const SortWatch({super.key});

  final String containerType = "";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is SortCartState) {
          return Column(
            children: [
              Row(
                children: [
                  CategortWidget(
                    textContainer: 'Price',
                    containerWidth: 80,
                    containerHeight: 50,
                    containerColor: state.value == 'price'
                        ? const Color(0xfffcc873)
                        : const Color(0xfff3f3f3),
                    onPressed: () {
                      context.read<CartBloc>().add(SortCartEvent(0));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CategortWidget(
                    containerColor: state.value == 'Rating'
                        ? const Color(0xfffcc873)
                        : const Color(0xfff3f3f3),
                    textContainer: 'Rating',
                    containerWidth: 90,
                    containerHeight: 50,
                    onPressed: () {
                      context.read<CartBloc>().add(SortCartEvent(1));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CategortWidget(
                    containerColor: state.value == 'popular'
                        ? const Color(0xfffcc873)
                        : const Color(0xfff3f3f3),
                    textContainer: 'Popularity',
                    containerWidth: 110,
                    containerHeight: 50,
                    onPressed: () {
                      context.read<CartBloc>().add(SortCartEvent(2));
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CategortWidget(
                    containerColor: state.value == 'popularity'
                        ? const Color(0xfffcc873)
                        : const Color(0xfff3f3f3),
                    textContainer: 'Top Selling',
                    containerWidth: 120,
                    containerHeight: 50,
                    onPressed: () {
                      context.read<CartBloc>().add(SortCartEvent(3));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CategortWidget(
                    containerColor: state.value == 'Deals & Discounts'
                        ? const Color(0xfffcc873)
                        : const Color(0xfff3f3f3),
                    textContainer: 'Deals & Discounts',
                    containerWidth: 170,
                    containerHeight: 50,
                    onPressed: () {
                      context.read<CartBloc>().add(SortCartEvent(4));
                    },
                  ),
                ],
              ),
            ],
          );
        }
        return Column(
          children: [
            Row(
              children: [
                CategortWidget(
                  textContainer: 'Price',
                  containerWidth: 80,
                  containerHeight: 50,
                  containerColor: containerType == 'price'
                      ? const Color(0xfffcc873)
                      : const Color(0xfff3f3f3),
                  onPressed: () {
                    context.read<CartBloc>().add(SortCartEvent(0));
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                CategortWidget(
                  containerColor: containerType == 'Rating'
                      ? const Color(0xfffcc873)
                      : const Color(0xfff3f3f3),
                  textContainer: 'Rating',
                  containerWidth: 90,
                  containerHeight: 50,
                  onPressed: () {
                    context.read<CartBloc>().add(SortCartEvent(1));
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                CategortWidget(
                  containerColor: containerType == 'popular'
                      ? const Color(0xfffcc873)
                      : const Color(0xfff3f3f3),
                  textContainer: 'Popularity',
                  containerWidth: 110,
                  containerHeight: 50,
                  onPressed: () {
                    context.read<CartBloc>().add(SortCartEvent(2));
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CategortWidget(
                  containerColor: containerType == 'popularity'
                      ? const Color(0xfffcc873)
                      : const Color(0xfff3f3f3),
                  textContainer: 'Top Selling',
                  containerWidth: 120,
                  containerHeight: 50,
                  onPressed: () {
                    context.read<CartBloc>().add(SortCartEvent(3));
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                CategortWidget(
                  containerColor: containerType == 'Deals & Discounts'
                      ? const Color(0xfffcc873)
                      : const Color(0xfff3f3f3),
                  textContainer: 'Deals & Discounts',
                  containerWidth: 170,
                  containerHeight: 50,
                  onPressed: () {
                    context.read<CartBloc>().add(SortCartEvent(4));
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
