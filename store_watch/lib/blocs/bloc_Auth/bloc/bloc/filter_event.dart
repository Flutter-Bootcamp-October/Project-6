part of 'filter_bloc.dart';

abstract class FilterEvent {}

class FilterClickEvent extends FilterEvent {
  final String textContainer;

  FilterClickEvent({required this.textContainer});
}

class FilterApplyEvent extends FilterEvent {
  final String textApply;

  FilterApplyEvent({required this.textApply});
}

class ChangeRangeSlider extends FilterEvent {
   final RangeValues value;

  ChangeRangeSlider(this.value);
}
