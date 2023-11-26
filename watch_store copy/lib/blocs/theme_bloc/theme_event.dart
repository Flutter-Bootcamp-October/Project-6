part of 'theme_bloc.dart';

abstract class ThemeEvent {}

class ChangeThemeEvent extends ThemeEvent {
  final String themeText;

  ChangeThemeEvent(this.themeText);
}

class GetThemeEvent extends ThemeEvent {}
