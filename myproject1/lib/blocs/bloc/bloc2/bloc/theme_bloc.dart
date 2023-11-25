import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopingpriject/blocs/bloc/bloc2/bloc/theme_event.dart';
import 'package:shopingpriject/blocs/bloc/bloc2/bloc/theme_state.dart';
import 'package:shopingpriject/theme/app_theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(GetThemeState(appThemeMap['light'])) {
    on<ChangeThemeEvent>((event, emit) {
      emit(GetThemeState(appThemeMap[event.themeText]));
    });
  }
}
