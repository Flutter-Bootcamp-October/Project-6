part of 'theme_bloc.dart';

abstract class ThemeState {}

final class ThemeInitial extends ThemeState {}

final class ChangedThemeState extends ThemeState {
  final String themeText;
  final IconData icon;
  final ThemeData theme;

  ChangedThemeState(
      {required this.themeText, required this.icon, required this.theme});
}
