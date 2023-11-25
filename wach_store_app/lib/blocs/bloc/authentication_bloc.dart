import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wach_store_app/blocs/bloc/authentication_event.dart';
import 'package:wach_store_app/blocs/bloc/authentication_state.dart';
import 'package:wach_store_app/global/global.dart';
import 'package:wach_store_app/models/user.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(InitialAuthenticationState()) {
    on<AuthenticationEvent>((event, emit) {
      if (event is SignUpEvent) {
        bool isMatched = false;
        if (event.name.isNotEmpty &&
            event.email.isNotEmpty &&
            event.password.isNotEmpty) {
          for (var user in userList) {
            if (user.email == event.email) {
              isMatched = true;
              break;
            }
          }
          if (!isMatched) {
            User newUser = User(
                name: event.name, email: event.email, password: event.password);

            userList.add(newUser);
            userObject = newUser;
            emit(SignUpSuccessedState());
          } else {
            isMatched = false;
            emit(ErrorState('Email is used'));
          }
        } else {
          emit(ErrorState('Please insert all text fields'));
        }
      } else if (event is SignInEvent) {
        bool isFound = false;
        for (var user in userList) {
          if (user.email == event.email && user.password == event.password) {
            userObject = user;
            isFound = true;
            emit(LoginSuccessedState());
          }
        }
        if (!isFound) {
          emit(ErrorState("email or password are incorrect"));
        }
      }
    });
  }
}
