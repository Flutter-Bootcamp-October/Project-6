import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wach_store_app/BLoCs/auth_bloc/auth_event.dart';
import 'package:wach_store_app/BLoCs/auth_bloc/auth_state.dart';
import 'package:wach_store_app/global/global.dart';
import 'package:wach_store_app/models/user.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<SignUpEvent>((event, emit) {
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
          emit(AuthSuccessState());
        } else {
          emit(AuthErrorState());
        }
      } else {
        emit(AuthEmptyState());
      }
    });

    on<SignInEvent>((event, emit) {
      if (event.email.isNotEmpty && event.password.isNotEmpty) {
        for (var user in userList) {
          if (user.email == event.email && user.password == event.password) {
            userObject = user;
            emit(AuthSuccessState());
            break;
          } else {
            emit(AuthErrorState());
          }
        }
      } else {
        emit(AuthEmptyState());
      }
    });
  }
}
