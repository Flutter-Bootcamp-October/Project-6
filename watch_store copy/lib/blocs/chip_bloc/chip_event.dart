part of 'chip_bloc.dart';

abstract class ChipEvent {}

final class ChipUpdateEvent extends ChipEvent {

  final int index;

  ChipUpdateEvent(
    this.index,
  );
}
