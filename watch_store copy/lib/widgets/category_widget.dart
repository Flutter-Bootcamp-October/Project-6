import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/blocs/chip_bloc/chip_bloc.dart';
import 'package:watch_store/styles/custom_colors.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> list = ["Trending", "Popular", "New", "Best Collection"];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 40,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return BlocBuilder<ChipBloc, ChipState>(
              builder: (context, state) {
                if (state is ChipUpdateState) {
                  return Choice(
                      index: index, selectedIndex: state.index, list: list);
                } else if (state is ChipInitial) {
                  return Choice(
                      index: index, selectedIndex: state.index, list: list);
                }
                return Container();
              },
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            width: 18,
          ),
        ),
      ),
    );
  }
}

class Choice extends StatelessWidget {
  const Choice(
      {Key? key,
      required this.index,
      required this.selectedIndex,
      required this.list})
      : super(key: key);

  final int index;
  final int selectedIndex;
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: Colors.white,
      label: Text(
        list[index],
        style: TextStyle(
          fontSize: 17,
          color:
              selectedIndex == index ? Colors.black : const Color(0xffB6B3B3),
        ),
      ),
      selected: selectedIndex == index,
      selectedColor: primary,
      onSelected: (value) {
        context.read<ChipBloc>().add(ChipUpdateEvent(index));
      },
    );
  }
}
