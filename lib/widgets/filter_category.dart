import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_bloc/bloc/cart_bloc.dart';
import 'category_widget.dart';

class FilterCategory extends StatelessWidget {
  const FilterCategory({super.key});
  final String containerType2 = '';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CategoryCartState) {
          return Column(
            children: [
              Row(
                children: [
                  CategortWidget(
                    containerColor: state.value == 'All Watches'
                        ? const Color(0xfffcc873)
                        : const Color(0xfff3f3f3),
                    textContainer: 'All Watches',
                    containerWidth: 110,
                    containerHeight: 50,
                    onPressed: () {
                      context.read<CartBloc>().add(FilterCartEvent(0));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CategortWidget(
                    containerColor: state.value == 'Metallic'
                        ? const Color(0xfffcc873)
                        : const Color(0xfff3f3f3),
                    textContainer: 'Metallic',
                    containerWidth: 100,
                    containerHeight: 50,
                    onPressed: () {
                      context.read<CartBloc>().add(FilterCartEvent(1));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CategortWidget(
                    containerColor: state.value == 'Leather'
                        ? const Color(0xfffcc873)
                        : const Color(0xfff3f3f3),
                    textContainer: 'Leather',
                    containerWidth: 100,
                    containerHeight: 50,
                    onPressed: () {
                      context.read<CartBloc>().add(FilterCartEvent(2));
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
                    containerColor: state.value == 'Expensive'
                        ? const Color(0xfffcc873)
                        : const Color(0xfff3f3f3),
                    textContainer: 'Expensive',
                    containerWidth: 100,
                    containerHeight: 50,
                    onPressed: () {
                      context.read<CartBloc>().add(FilterCartEvent(3));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CategortWidget(
                    containerColor: state.value == 'Classical'
                        ? const Color(0xfffcc873)
                        : const Color(0xfff3f3f3),
                    textContainer: 'Classical',
                    containerWidth: 100,
                    containerHeight: 50,
                    onPressed: () {
                      context.read<CartBloc>().add(FilterCartEvent(4));
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
                  containerColor: containerType2 == 'All Watches'
                      ? const Color(0xfffcc873)
                      : const Color(0xfff3f3f3),
                  textContainer: 'All Watches',
                  containerWidth: 110,
                  containerHeight: 50,
                  onPressed: () {
                    context.read<CartBloc>().add(FilterCartEvent(0));
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                CategortWidget(
                  containerColor: containerType2 == 'Metallic'
                      ? const Color(0xfffcc873)
                      : const Color(0xfff3f3f3),
                  textContainer: 'Metallic',
                  containerWidth: 100,
                  containerHeight: 50,
                  onPressed: () {
                    context.read<CartBloc>().add(FilterCartEvent(1));
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                CategortWidget(
                  containerColor: containerType2 == 'Leather'
                      ? const Color(0xfffcc873)
                      : const Color(0xfff3f3f3),
                  textContainer: 'Leather',
                  containerWidth: 100,
                  containerHeight: 50,
                  onPressed: () {
                    context.read<CartBloc>().add(FilterCartEvent(2));
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
                  containerColor: containerType2 == 'Expensive'
                      ? const Color(0xfffcc873)
                      : const Color(0xfff3f3f3),
                  textContainer: 'Expensive',
                  containerWidth: 100,
                  containerHeight: 50,
                  onPressed: () {
                    context.read<CartBloc>().add(FilterCartEvent(3));
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                CategortWidget(
                  containerColor: containerType2 == 'Classical'
                      ? const Color(0xfffcc873)
                      : const Color(0xfff3f3f3),
                  textContainer: 'Classical',
                  containerWidth: 100,
                  containerHeight: 50,
                  onPressed: () {
                    context.read<CartBloc>().add(FilterCartEvent(4));
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
