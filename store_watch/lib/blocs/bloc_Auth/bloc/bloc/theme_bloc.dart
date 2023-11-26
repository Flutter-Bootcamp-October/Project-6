import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_watch/theme/app_theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(GetThemeState(themeData: appThemeMap['light'])) {
    on<ChangeThemeEvent>((event, emit) {
      emit(GetThemeState(themeData: appThemeMap[event.themeText]));
    });
  }
}
