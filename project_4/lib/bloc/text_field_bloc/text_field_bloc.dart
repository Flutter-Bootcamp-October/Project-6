import 'package:flutter_bloc/flutter_bloc.dart';

part 'text_field_event.dart';
part 'text_field_state.dart';

class TextFieldBloc extends Bloc<TextFieldEvent, TextFieldState> {
  TextFieldBloc() : super(TextFieldInitial(isObscure: true)) {
    on<ChangeObscureEvent>((event, emit) {
      emit(TextFieldObscure(isObscure: event.isObscure));
    });
  }
}
