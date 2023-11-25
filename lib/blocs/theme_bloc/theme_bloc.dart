import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../theme/get_theme.dart';
import '../../theme/mode_theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial(appTheme[getTheme()])) {
    on<ChangeThemeEvent>((event, emit) {
      setTheme(event.value);
      emit(ThemeInitial(appTheme[event.value]));
    });
    on<GetThemeEvent>((event, emit) {
      emit(ThemeInitial(appTheme[getTheme()]));
    });
  }
}
