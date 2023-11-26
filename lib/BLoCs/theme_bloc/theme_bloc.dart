import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wach_store_app/BLoCs/theme_bloc/theme_event.dart';
import 'package:wach_store_app/BLoCs/theme_bloc/theme_state.dart';
import 'package:wach_store_app/theme/app_theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(InitState()) {
    on<ChangeThemeEvent>((event, emit) {
      emit(GetThemeState(appTheme[event.theme]!));
    });
  }
}
