part of 'text_field_bloc.dart';

abstract class TextFieldState {
  final bool isObscure;

  TextFieldState({required this.isObscure});
}

class TextFieldInitial extends TextFieldState {
  TextFieldInitial({required super.isObscure});
}

class TextFieldObscure extends TextFieldState {
  TextFieldObscure({required super.isObscure});
}
