part of 'product_bloc.dart';

abstract class ProductState {}

final class ProductInitial extends ProductState {}

final class UpdateCountState extends ProductState {
  final int count;

  UpdateCountState({required this.count});
}

final class ShowFilterdlistState extends ProductState {
  final List<Product> filteredList;

  ShowFilterdlistState({required this.filteredList});
}

final class ReturnSelectedCategoryState extends ProductState {
  final int category;

  ReturnSelectedCategoryState({required this.category});
}

final class ReturnSelectedSortState extends ProductState {
  final int sort;

  ReturnSelectedSortState({required this.sort});
}

final class UpdateRangeState extends ProductState {
  final RangeValues currentRangeValues;

  UpdateRangeState({required this.currentRangeValues});
}
