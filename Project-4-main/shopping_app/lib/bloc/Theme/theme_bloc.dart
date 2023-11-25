import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/global/global.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ChangedThemeState(
            themeText: 'dark',
            icon: Icons.nightlight_outlined,
            theme: appThemeMap['light']!)) {
    on<ChangeThemeEvent>((event, emit) {
      if (event.theme == 'light') {
        emit(ChangedThemeState(
            themeText: 'dark',
            icon: Icons.nightlight_outlined,
            theme: appThemeMap['light']!));
      } else {
        emit(ChangedThemeState(
            themeText: 'light',
            icon: Icons.sunny,
            theme: appThemeMap['dark']!));
      }
    });
  }
}
