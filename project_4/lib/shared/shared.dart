import 'package:project_4/main.dart';

getCurrentTheme() {
  return pref.getString("theme") ?? "light";
}

setTheme(String themeText) async {
  pref.setString("theme", themeText);
}
