import 'package:bloc/bloc.dart';
import 'package:shopping_watch_application_bloc/Data/global.dart';
import 'package:shopping_watch_application_bloc/Model/User_model.dart';
import 'package:shopping_watch_application_bloc/blocs/auth_bloc/auth_event.dart';
import 'package:shopping_watch_application_bloc/blocs/auth_bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignUpEvent>(
      (event, emit) {
        bool isMatched = false;

        if (event.fullName.isNotEmpty &&
            event.email.isNotEmpty &&
            event.password.isNotEmpty) {
          for (var user in userList) {
            if (user.emailAddress == event.email) {
              isMatched = true;
            }
          }
          if (!isMatched) {
            User newUser = User(
                fullName: event.fullName,
                emailAddress: event.email,
                password: event.password);

            userList.add(newUser);
            emit(SignUpSuccessedState());
          } else {
            isMatched = false;
            emit(ErrorState("Email is used"));
          }
        } else {
          emit(ErrorState("Please insert all text fields"));
        }
      },
    );

    on<SignInEvent>((event, emit) {
      bool isFound = false;
      for (var user in userList) {
        if (user.emailAddress == event.email &&
            user.password == event.password) {
          currentUser = user;
          isFound = true;
          emit(SiginSuccessedState());
        }
      }
      if (!isFound) {
        emit(ErrorState('email or password are incorrect'));
      }
    });
  }
}
