part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  SignUpEvent(
    this.name,
    this.email,
    this.password,
  );
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
}

class UpdateProfileEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String mobileNumber;

  UpdateProfileEvent(
      {required this.name,
      required this.email,
      required this.password,
      required this.mobileNumber});
}
