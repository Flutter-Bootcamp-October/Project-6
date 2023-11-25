

import 'package:wach_store_app/main.dart';

getCurrentTheme() {
  return prefs.getString("theme") ?? 'light';
}

setTheme(String themeText) {
  prefs.setString('theme', themeText);
}
