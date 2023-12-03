abstract class ThemeEvent {}

class GetThemeEvent extends ThemeEvent {}

class ChangeThemeEvent extends ThemeEvent {
  final String themeText;

  ChangeThemeEvent({required this.themeText});
}
