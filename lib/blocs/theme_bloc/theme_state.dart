part of 'theme_bloc.dart';

abstract class ThemeState {}

final class ThemeInitial extends ThemeState {
  final ThemeData themeData;

  ThemeInitial(this.themeData);
}
