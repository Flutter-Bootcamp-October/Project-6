import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:watch_store/global/app_theme.dart';
import 'package:watch_store/global/shared_pre.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(GetThemeState(appTheme[getCurrentTheme()])) {
    on<ChangeThemeEvent>((event, emit) {
      setTheme(theme: event.themeText);
      emit(GetThemeState(appTheme[event.themeText]));
    });

    on<GetThemeEvent>((event, emit) {
      final String currentTheme = getCurrentTheme();
      emit(GetThemeState(appTheme[currentTheme]));
    });
  }
}
