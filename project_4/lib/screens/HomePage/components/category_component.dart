import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/bloc/filter_bloc/filter_bloc.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List categoryList = ["Trending", "Popular", "New", "Best Collection"];
    return SizedBox(
      height: 60,
      child: BlocBuilder<FilterBloc, FilterState>(
        builder: (context, state) {
          return ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              return ChoiceChip(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                backgroundColor: Colors.transparent,
                label: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 70,
                    child: Text(
                      categoryList[index],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                selected: state is FilterHomeSelectChipState
                    ? state.index == index
                    : index == 0
                        ? true
                        : false,
                selectedColor: const Color(0xfffccf78),
                onSelected: (value) {
                  context.read<FilterBloc>().add(FilterHomeSelectChipEvent(index: index));
                },
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 8,
            ),
          );
        },
      ),
    );
  }
}
