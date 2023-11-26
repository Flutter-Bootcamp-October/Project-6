import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/bloc/filter_bloc/filter_bloc.dart';

class FilterChips extends StatelessWidget {
  const FilterChips({
    super.key,
    required this.chipList,
    this.onTapFunc,
    required this.state,
  });

  final List<String> chipList;
  final Function()? onTapFunc;
  final state;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ...List.generate(
          chipList.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
            child: InkWell(
              borderRadius: BorderRadius.circular(18),
              onTap: () {
                context.read<FilterBloc>().add(FilterSelectChipEvent(index: index));
              },
              child: Chip(
                backgroundColor: (state is FilterChangedChipState ? state.index == index : false)
                    ? const Color(0xfffccf78)
                    : const Color.fromARGB(255, 241, 241, 241),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                padding: const EdgeInsets.all(14),
                label: Text(chipList[index]),
              ),
            ),
          ),
        )
      ],
    );
  }
}
