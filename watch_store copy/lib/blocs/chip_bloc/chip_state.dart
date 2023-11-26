part of 'chip_bloc.dart';

@immutable
sealed class ChipState {}

final class ChipInitial extends ChipState {
  final int index = 0;
}

final class ChipUpdateState extends ChipState {

  final int index;
  ChipUpdateState( this.index);
}
