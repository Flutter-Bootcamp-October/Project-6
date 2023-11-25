import '../main.dart';

getTheme() {
  return prefs!.getString("theme") ?? "light";
}

setTheme(String theme) async {
  await prefs!.setString("theme", theme);
}
