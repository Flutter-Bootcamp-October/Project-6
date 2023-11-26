part of 'nav_bloc.dart';

@immutable
sealed class NavState {}

final class NavInitialState extends NavState {
  final int indexPage;

  NavInitialState({required this.indexPage});
}

final class NavPageState extends NavState {}

