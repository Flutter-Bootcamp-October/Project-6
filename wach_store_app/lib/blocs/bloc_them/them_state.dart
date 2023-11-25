part of 'them_bloc.dart';

@immutable
sealed class ThemState {}

final class GetThemeState extends ThemState {
  final ThemeData themeData;

  GetThemeState(this.themeData);
}

