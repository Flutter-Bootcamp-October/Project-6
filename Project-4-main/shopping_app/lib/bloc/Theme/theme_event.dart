part of 'theme_bloc.dart';

abstract class ThemeEvent {}

class ChangeThemeEvent extends ThemeEvent {
  final String theme;
  final IconData icon;

  ChangeThemeEvent({required this.theme, required this.icon});
}
