part of 'theme_bloc.dart';

@immutable
sealed class ThemeState {}

final class GetThemeState extends ThemeState {
  final ThemeData themeData;

  GetThemeState(this.themeData);
}
