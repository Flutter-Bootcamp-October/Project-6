part of 'them_bloc.dart';

@immutable
sealed class ThemEvent {}

class changeThemeEvent extends ThemEvent {
  final String themeText;

  changeThemeEvent(this.themeText);
}


class GetThemeEvent extends ThemEvent{}
