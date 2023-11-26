import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_watch/blocs/bloc_Auth/bloc/bloc/filter_bloc.dart';

class CategortWidget extends StatelessWidget {
  const CategortWidget({
    super.key,
    required this.containerWidth,
    required this.containerHeight,
    required this.textContainer,
    required this.onPressed,
    this.containerColor,
  });

  final Function() onPressed;
  final double containerWidth;
  final double containerHeight;
  final String textContainer;
  final Color? containerColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: BlocBuilder<FilterBloc, FilterState>(
        builder: (context, state) {
          bool isPickedColor = state is ColorClickState
              ? state.textContainer == textContainer
                  ? true
                  : false
              : false;
          return Container(
            width: containerWidth,
            height: containerHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: isPickedColor
                  ? const Color(0xfffcc873)
                  : const Color(0xfff3f3f3),
            ),
            child: Center(
              child: Text(
                textContainer,
                style: const TextStyle(color: Color(0xff2f343b), fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}
