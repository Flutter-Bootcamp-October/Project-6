part of 'bottom_nav_bloc.dart';

abstract class BottomNavState {
  final int selectedIndex;

  BottomNavState({required this.selectedIndex});
}

class BottomNavInitial extends BottomNavState {
  BottomNavInitial({required super.selectedIndex});
}

class ChangeIndexState extends BottomNavState {
  ChangeIndexState({required super.selectedIndex});
}
