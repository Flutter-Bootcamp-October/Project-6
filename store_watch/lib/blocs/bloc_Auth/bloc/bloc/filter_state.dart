part of 'filter_bloc.dart';

abstract class FilterState {}

final class FilterInitial extends FilterState {}

final class DefultColorState extends FilterState {
  // final Color colorContainerDeful;

  // DefultColorState({required this.colorContainerDeful});
}

final class ColorClickState extends FilterState {
  final String textContainer;
  ColorClickState({required this.textContainer});
}

final class ApplyPriceSuccessState extends FilterState {}

final class ApplyPopularitySuccessState extends FilterState {}

final class ApplyNotSuccessState extends FilterState {
  final String messageNotSuccess;

  ApplyNotSuccessState({required this.messageNotSuccess});
}

final class ChangeRangeSliderState extends FilterState {
  final RangeValues value;

  ChangeRangeSliderState({required this.value});
}
