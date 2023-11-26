import 'package:store_watch/main.dart';

getCurrentTheme() {
  return prefs.getString("theme") ?? "light";
}

setTheme(String themeText) {
  prefs.setString("theme", themeText);
}
