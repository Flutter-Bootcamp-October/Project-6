import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/blocs/theme/bloc/app_theme.dart';
import 'package:project_4/blocs/theme/bloc/theme_event.dart';
import 'package:project_4/blocs/theme/bloc/theme_state.dart';
import 'package:project_4/shared/shared.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(GetThemeState(appThemeMap[getCurrentTheme()])) {
    on<ChangeThemeEvent>((event, emit) {
      setTheme(event.themeText);
      emit(GetThemeState(appThemeMap[event.themeText]));
    });

    on<GetThemeEvent>((event, emit) async {
      final currentThemeText = await getCurrentTheme();
      emit(GetThemeState(appThemeMap[currentThemeText]));
    });
  }
}
