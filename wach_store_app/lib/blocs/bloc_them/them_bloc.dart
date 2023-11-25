import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:wach_store_app/theme/shared_preferences.dart';
import 'package:wach_store_app/theme/theme_app.dart';

part 'them_event.dart';
part 'them_state.dart';

class ThemBloc extends Bloc<ThemEvent, ThemState> {
  ThemBloc() : super(GetThemeState(appThemMap[getCurrentTheme()])) {
    on<changeThemeEvent>((event, emit) {
      setTheme(event.themeText);
      emit(GetThemeState(appThemMap[event.themeText]));
    });
    on<GetThemeEvent>((event, emit) async {
      final currentTheme = await getCurrentTheme();
      emit(GetThemeState(appThemMap[currentTheme]));
    });
  }
}
