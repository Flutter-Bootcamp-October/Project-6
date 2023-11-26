import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_watch/blocs/theme_bloc/them_.state.dart';
import 'package:store_watch/blocs/theme_bloc/them_event.dart';
import 'package:store_watch/theme/app_theme.dart';
import 'package:store_watch/theme/shared_preferences.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(GetThemeState(themeData: appThemeMap[getCurrentTheme()])) {
    on<ChangeThemeEvent>((event, emit) {
      setTheme(event.themeText);
      //event.themetext -> "light" / "dark"
      emit(GetThemeState(themeData: appThemeMap[event.themeText]));
    });

    on<GetThemeEvent>(
      (event, emit) async {
        final currentThemeText = await getCurrentTheme();
        emit(GetThemeState(themeData: appThemeMap[currentThemeText]));
      },
    );
  }
}
