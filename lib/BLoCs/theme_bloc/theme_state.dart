import 'package:flutter/material.dart';

abstract class ThemeState {}

class InitState extends ThemeState {}

class GetThemeState extends ThemeState {
  final ThemeData theme;
  GetThemeState(this.theme);
}
