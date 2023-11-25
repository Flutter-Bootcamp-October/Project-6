part of 'bottom_nav_bloc.dart';

abstract class BottomNavEvent {
  final int index;

  BottomNavEvent({required this.index});
}

class ChangeIndexEvent extends BottomNavEvent {
  ChangeIndexEvent({required super.index});
}
