part of 'nav_bloc.dart';

abstract class NavEvent {}

class ClickNavEvent extends NavEvent {
  final int clickIndex;

  ClickNavEvent({required this.clickIndex});
}
