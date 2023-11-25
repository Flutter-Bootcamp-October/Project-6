part of 'theme_bloc.dart';

abstract class ThemeEvent {}

class ChangeThemeEvent extends ThemeEvent {
  final String value;

  ChangeThemeEvent(this.value);
}

class GetThemeEvent extends ThemeEvent {}
