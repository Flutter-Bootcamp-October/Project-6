part of 'product_bloc.dart';

abstract class ProductEvent {}

class IncreamentCountEvent extends ProductEvent {
  final int count;

  IncreamentCountEvent({required this.count});
}

class DecreamentCountEvent extends ProductEvent {
  final int count;

  DecreamentCountEvent({required this.count});
}

class SelecCategoryEvent extends ProductEvent {
  final int category;

  SelecCategoryEvent({required this.category});
}

class SelectSortEvent extends ProductEvent {
  final int sort;

  SelectSortEvent({required this.sort});
}

class ApplyEvent extends ProductEvent {
  final int categorySelected;
  final int sortBy;
  final RangeValues currentRangeValues;

  ApplyEvent(
      {required this.currentRangeValues,
      required this.categorySelected,
      required this.sortBy});
}

final class ChageRangeEvent extends ProductEvent {
  final RangeValues currentRangeValues;

  ChageRangeEvent({required this.currentRangeValues});
}
