import 'package:watch_store/main.dart';

getCurrentTheme() {
  return prefs!.getString('theme') ?? "light";
}

setTheme({required String theme}) {
  return prefs!.setString('theme', theme);
}
