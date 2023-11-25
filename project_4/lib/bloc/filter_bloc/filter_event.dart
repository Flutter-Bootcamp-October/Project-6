part of 'filter_bloc.dart';

abstract class FilterEvent {}

class FilterSelectChipEvent extends FilterEvent {
  final int index;
  FilterSelectChipEvent({required this.index});
}

class FilterHomeSelectChipEvent extends FilterEvent {
  final int index;
  FilterHomeSelectChipEvent({required this.index});
}

class FilterRangeEvent extends FilterEvent {
  final SfRangeValues range;
  FilterRangeEvent({required this.range});
}
