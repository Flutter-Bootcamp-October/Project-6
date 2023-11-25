import 'package:shopingpriject/blocs/bloc/bloc2/bloc/theme_bloc.dart';

abstract class ThemeEvent {}

class ChangeThemeEvent extends ThemeEvent {
  final String themeText;

  ChangeThemeEvent(this.themeText);
}

class GetThemeEvent extends ThemeBloc {}
