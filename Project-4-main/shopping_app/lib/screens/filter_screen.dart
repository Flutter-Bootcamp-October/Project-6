import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/bloc/product_bloc/product_bloc.dart';
import 'package:shopping_app/widgets/button_widget.dart';
import 'package:shopping_app/widgets/filter_criteria.dart';
import 'package:shopping_app/widgets/my_app_bar.dart';
import 'package:shopping_app/widgets/price_range.dart';
import 'package:shopping_app/widgets/show_watch.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int categorySelected = 0;
    int sortWaySelected = 0;
    RangeValues currentRangeValues = const RangeValues(0, 10000);
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ReturnSelectedCategoryState) {
          categorySelected = state.category;
        }
        if (state is ReturnSelectedSortState) {
          sortWaySelected = state.sort;
        }
        if (state is UpdateRangeState) {
          currentRangeValues = state.currentRangeValues;
        }
        return Scaffold(
          appBar: const MyAppBar(
              leadingIcon: Icons.arrow_back_ios_new_rounded,
              title: "Filter",
              actionIcon: Icons.close_rounded),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Select Category",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Wrap(spacing: 8, runSpacing: 8, children: [
                  InkWell(
                    onTap: () {
                      categorySelected = 0;
                      context
                          .read<ProductBloc>()
                          .add(SelecCategoryEvent(category: categorySelected));
                    },
                    child: FilterCriteria(
                      text: "All Watches",
                      isSelected: categorySelected == 0,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      categorySelected = 1;
                      context
                          .read<ProductBloc>()
                          .add(SelecCategoryEvent(category: categorySelected));
                    },
                    child: FilterCriteria(
                      text: "Metallic",
                      isSelected: categorySelected == 1,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      categorySelected = 2;
                      context
                          .read<ProductBloc>()
                          .add(SelecCategoryEvent(category: categorySelected));
                    },
                    child: FilterCriteria(
                      text: "Leather",
                      isSelected: categorySelected == 2,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      categorySelected = 3;
                      context
                          .read<ProductBloc>()
                          .add(SelecCategoryEvent(category: categorySelected));
                    },
                    child: FilterCriteria(
                      text: "Expensive",
                      isSelected: categorySelected == 3,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      categorySelected = 4;
                      context
                          .read<ProductBloc>()
                          .add(SelecCategoryEvent(category: categorySelected));
                    },
                    child: FilterCriteria(
                      text: "Classic",
                      isSelected: categorySelected == 4,
                    ),
                  ),
                ]),
                const SizedBox(height: 15),
                const Text("Sort Watches By",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Wrap(spacing: 8, runSpacing: 8, children: [
                  InkWell(
                    onTap: () {
                      sortWaySelected = 0;
                      context
                          .read<ProductBloc>()
                          .add(SelectSortEvent(sort: sortWaySelected));
                    },
                    child: FilterCriteria(
                      text: "Price",
                      isSelected: sortWaySelected == 0,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      sortWaySelected = 1;
                      context
                          .read<ProductBloc>()
                          .add(SelectSortEvent(sort: sortWaySelected));
                    },
                    child: FilterCriteria(
                      text: "Rating",
                      isSelected: sortWaySelected == 1,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      sortWaySelected = 2;
                      context
                          .read<ProductBloc>()
                          .add(SelectSortEvent(sort: sortWaySelected));
                    },
                    child: FilterCriteria(
                      text: "Pupularity",
                      isSelected: sortWaySelected == 2,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      sortWaySelected = 3;
                      context
                          .read<ProductBloc>()
                          .add(SelectSortEvent(sort: sortWaySelected));
                    },
                    child: FilterCriteria(
                      text: "Top selling",
                      isSelected: sortWaySelected == 3,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      sortWaySelected = 4;
                      context
                          .read<ProductBloc>()
                          .add(SelectSortEvent(sort: sortWaySelected));
                    },
                    child: FilterCriteria(
                      text: "Deals & Discounts",
                      isSelected: sortWaySelected == 4,
                    ),
                  )
                ]),
                const SizedBox(height: 8),
                const Text("Select Price Range",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                PriceRange(currentRangeValues: currentRangeValues),
                BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    if (state is ShowFilterdlistState) {
                      return SizedBox(
                        height: 350,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.filteredList.length,
                            shrinkWrap: true,
                            itemBuilder: (_, index) {
                              return ShowWatch(
                                  product: state.filteredList[index]);
                            }),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: ButtonCustom(
              buttonChild: const Text("Apply"),
              onPressed: () {
                context.read<ProductBloc>().add(ApplyEvent(
                    currentRangeValues: currentRangeValues,
                    categorySelected: categorySelected,
                    sortBy: sortWaySelected));
              },
              radius: 20),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
}
