import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/bloc/auth_bloc/auth_evemt.dart';
import 'package:shopping_app/bloc/auth_bloc/auth_state.dart';
import 'package:shopping_app/global/global.dart';
import 'package:shopping_app/models/user_model.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(InitialState()) {
    on<SignupEvent>((event, emit) {
      if (event.email.isNotEmpty &&
          event.name.isNotEmpty &&
          event.password.isNotEmpty) {
        if (usersList
            .where((element) => element.email == event.email)
            .isNotEmpty) {
          emit(ErrorState(
              "This email has been used in another account, try with different email"));
        } else {
          currentUser = User(
              email: event.email,
              fullName: event.name,
              imagePath: 'assets/images/empty_profile.png',
              mobileNumber: '0555555555',
              password: event.password);
          usersList.add(currentUser);
          emit(SeccessAuth());
        }
      } else {
        emit(ErrorState("Please fill out all required fields"));
      }
    });

    on<SigninEvent>((event, emit) {
      if (event.email.isNotEmpty && event.password.isNotEmpty) {
        if (usersList
            .where((element) => element.email == event.email)
            .isEmpty) {
          emit(ErrorState("No account with this email was found"));
        } else {
          bool notFound = true;
          for (User user in usersList) {
            if (user.email == event.email && user.password == event.password) {
              notFound = false;
              currentUser = user;
              emit(SeccessAuth());
            }
          }
          if (notFound) {
            return emit(ErrorState("Incorrect Password"));
          }
        }
      }
      emit(ErrorState("Please fill out all required fields"));
    });
  }
}
