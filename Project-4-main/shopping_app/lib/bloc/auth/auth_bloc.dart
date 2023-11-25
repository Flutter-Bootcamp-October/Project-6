import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/bloc/auth/auth_event.dart';
import 'package:shopping_app/bloc/auth/auth_state.dart';
import 'package:shopping_app/global/global.dart';
import 'package:shopping_app/models/user_model.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  RegExp emailFormat = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  AuthBloc() : super(InitialAuthState()) {
    on<SignUpEvent>((event, emit) {
      if (event.email.isNotEmpty &&
          event.name.isNotEmpty &&
          event.password.isNotEmpty) {
        if (emailFormat.hasMatch(event.email)) {
          currentUser = User(
              email: event.email,
              fullName: event.name,
              imagePath: 'assets/images/empty_profile.png',
              mobileNumber: '0555555555',
              password: event.password);
          // print("current user: ${currentUser.fullName}");
          if (usersList
              .where((element) => element.email == event.email)
              .isNotEmpty) {
            emit(AuthErrorState(
                message:
                    "This email has been used in another account, try with different email"));
          } else if (usersList.contains(currentUser)) {
            emit(AuthErrorState(
                message:
                    "Seems like you're already a member. Please sign in instead"));
          } else {
            usersList.add(currentUser);
            for (User user in usersList) {
              user.usertoSring();
            }
            emit(UpdateSuccessState());
            emit(SignUpSuccessState());
          }
        } else {
          emit(AuthErrorState(message: "Please use a valid email to sign up"));
        }
      } else {
        emit(AuthErrorState(message: "Please fill out all required fields"));
      }
    });
    on<SignInEvent>((event, emit) {
      if (event.email.isNotEmpty && event.password.isNotEmpty) {
        if (usersList
            .where((element) => element.email == event.email)
            .isEmpty) {
          emit(AuthErrorState(message: "No account with this email was found"));
          //sign up?
        } else {
          bool notFound = true;
          for (User user in usersList) {
            if (user.email == event.email && user.password == event.password) {
              notFound = false;
              currentUser = user;
              emit(SignInSuccessState());
            }
          }
          if (notFound) {
            emit(AuthErrorState(message: "Incorrect credintials"));
          }
        }
      } else {
        emit(AuthErrorState(message: "Please fill out all required fields"));
      }
    });
    on<UpdateProfileEvent>((event, emit) {
      if (event.name.isNotEmpty &&
          event.password.isNotEmpty &&
          event.email.isNotEmpty) {
        currentUser.email = event.email;
        currentUser.password = event.password;
        currentUser.fullName = event.name;
        currentUser.mobileNumber = event.phone;
        for (User user in usersList) {
          user.usertoSring();
        }
        emit(UpdateSuccessState());
      } else {
        emit(AuthErrorState(message: "Please fill out required field"));
      }
    });
  }
}
