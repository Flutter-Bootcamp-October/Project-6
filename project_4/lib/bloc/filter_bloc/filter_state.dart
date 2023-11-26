part of 'filter_bloc.dart';

abstract class FilterState {}

class FilterInitialState extends FilterState {}

class FilterChangedChipState extends FilterState {
  final int index;
  FilterChangedChipState({required this.index});
}

class FilterHomeSelectChipState extends FilterState {
  final int index;
  FilterHomeSelectChipState({required this.index});
}

class FilterChangedRangeState extends FilterState {
  final SfRangeValues? range;
  FilterChangedRangeState({required this.range});
}
