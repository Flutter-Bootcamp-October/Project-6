import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopingpriject/blocs/bloc/auth_event.dart';
import 'package:shopingpriject/blocs/bloc/auth_state.dart';
import 'package:shopingpriject/data/global.dart';
import 'package:shopingpriject/models/user_model.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignUpEvent>((event, emit) {
      bool isMatched = false;
      if (event.name.isNotEmpty &&
          event.email.isNotEmpty &&
          event.password.isNotEmpty) {
        for (var user in userList) {
          if (user.email == event.email) {
            isMatched = true;
          }
        }
        if (!isMatched) {
          User newUser = User(
              name: event.name, email: event.email, password: event.password);
          currentUser = newUser;

          userList.add(newUser);
          emit(SignUpSuccessedState());
        } else {
          isMatched = false;
          emit(ErrorState("Email is used"));
        }
      } else {
        emit(ErrorState("Please insert alll text fields"));
      }
    });

    on<SignInEvent>((event, emit) {
      bool isSignInSuccessful = false;
      for (var user in userList) {
        if ((user.email == event.email || user.name == event.email) &&
            user.password == event.password) {
          currentUser = user;
          isSignInSuccessful = true;
          emit(SignInSuccessedState());

          break;
        }
      }

      if (isSignInSuccessful) {
        emit(ErrorState("You have successfully signed in!'"));
      } else {
        emit(ErrorState("Invalid credentials"));
      }
    });
  }
}
