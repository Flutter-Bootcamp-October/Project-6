part of 'nav_bloc_bloc.dart';

abstract class NavBlocEvent {}

class TabEvent extends NavBlocEvent {
  final int index;

  TabEvent({required this.index});
}
