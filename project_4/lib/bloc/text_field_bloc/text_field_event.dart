part of 'text_field_bloc.dart';

abstract class TextFieldEvent {}

class ChangeObscureEvent extends TextFieldEvent {
  final bool isObscure;

  ChangeObscureEvent({required this.isObscure});
}
