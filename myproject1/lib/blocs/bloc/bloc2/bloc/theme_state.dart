import 'package:flutter/material.dart';

abstract class ThemeState {}

final class GetThemeState extends ThemeState {
  final ThemeData themeDate;

  GetThemeState(this.themeDate);
}
