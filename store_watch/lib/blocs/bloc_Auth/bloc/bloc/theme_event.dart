part of 'theme_bloc.dart';

abstract class ThemeEvent {}

class ChangeThemeEvent extends ThemeEvent {
  final String themeText;

  ChangeThemeEvent({required this.themeText});
}
