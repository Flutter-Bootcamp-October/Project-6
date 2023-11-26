import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/bloc/cart_bloc/cart_bloc.dart';
import 'package:project_4/models/watch_model.dart';
import 'package:project_4/widgets/custom_button.dart';
import 'components/details_page_main_widget.dart';
import 'components/details_screen_app_bar.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.watch});

  final Watch watch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 32.0),
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return CustomButton(
              onPressedFunc: () {
                context.read<CartBloc>().add(CartAddEvent(watch: watch, itemCount: state.counter));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        "${state.counter} items of (${watch.name}) has been added, total is: ${watch.count + state.counter}")));
                context.read<CartBloc>().add(CartResetCounter(watch: watch));
              },
              content: "Add to Cart",
              hasIcon: true,
            );
          },
        ),
      ),
      appBar: detailsScreenAppBar(context: context, watch: watch),
      body: DetailsPageMainWidget(watch: watch),
    );
  }
}

// int count = 1;
