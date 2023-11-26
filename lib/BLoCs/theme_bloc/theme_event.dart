abstract class ThemeEvent {}

class ChangeThemeEvent extends ThemeEvent {
  String theme;
  ChangeThemeEvent({required this.theme});
}
