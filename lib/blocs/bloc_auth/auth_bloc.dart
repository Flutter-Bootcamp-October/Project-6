import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/data/global.dart';
import 'package:shopping_app/extensions/reg_exp.dart';
import 'package:shopping_app/models/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<UpdateProfileEvent>((event, emit) {
      if (event.name.isNotEmpty &&
          event.password.isNotEmpty &&
          event.email.isNotEmpty &&
          event.mobileNumber.isNotEmpty) {
        currentUser.email = event.email;
        currentUser.password = event.password;
        currentUser.fullName = event.name;
        currentUser.mobileNumber = event.mobileNumber;
        emit(UpdateSuccessedState());
      } else {
        emit(ErrorState("Please fill out all required fields"));
      }
    });

    on<SignUpEvent>((event, emit) {
      bool isMatched = false;

      if (event.name.isNotEmpty &&
          event.email.isNotEmpty &&
          event.password.isNotEmpty) {
        if (event.email.isValidEmail) {
          for (var user in usersList) {
            if (user.email == event.email) {
              isMatched = true;
            }
          }
          if (!isMatched) {
            User newUser = User(
                fullName: event.name,
                email: event.email,
                password: event.password,
                mobileNumber: '');

            usersList.add(newUser);
            emit(SignUpSuccessedState());
          } else {
            isMatched = false;
            emit(ErrorState("Email is used"));
          }
        } else {
          emit(ErrorState("Email is not vaild"));
        }
      } else {
        emit(ErrorState("Please insert all text fields"));
      }
    });

    on<LoginEvent>((event, emit) {
      bool isFound = false;
      for (var user in usersList) {
        if (user.email == event.email && user.password == event.password) {
          currentUser = user;
          isFound = true;
          emit(LoginSuccessedState());
        }
      }
      if (!isFound) {
        emit(ErrorState("email or password are incorrect"));
      }
    });
  }
}
