import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:watch_store/global/global.dart';
import 'package:watch_store/models/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignUpEvent>((event, emit) {
      bool isMatched = false;
      if (event.name.isNotEmpty &&
          event.email.isNotEmpty &&
          event.password.isNotEmpty) {
        //dublecate email
        for (var user in usersList) {
          if (user.email == event.email) {
            isMatched = true;
          }
        }
        if (!isMatched) {
          User newUser = User(
              name: event.name,
              email: event.email,
              password: event.password,
              phone: '');

          usersList.add(newUser);
          currentUser = newUser;
          emit(SignUpState());
        } else {
          isMatched = false;
          emit(ErrorState("Email is used"));
        }
      } else {
        emit(ErrorState("Please enter all the fields"));
      }
    });
    on<LoginEvent>((event, emit) {
      bool isMatched = false;
      for (var user in usersList) {
        if (user.email == event.email && user.password == event.password) {
          currentUser = user;
          emit(LoginState());
          isMatched = true;
        }
      }
      if (!isMatched) {
        emit(ErrorState("Email or Password are incorrect"));
      }
    });

    on<UpdateProfileEvent>((event, emit) {
      if (event.name.isNotEmpty &&
          event.email.isNotEmpty &&
          event.password.isNotEmpty &&
          event.phone.isNotEmpty) {
        currentUser.name = event.name;
        currentUser.email = event.email;
        currentUser.password = event.password;
        currentUser.phone = event.phone;
        emit(UpdateProfileState("Update Successfully !"));
      } else {
        emit(ErrorState("Please enter all the fields"));
      }
    });
  }
}
