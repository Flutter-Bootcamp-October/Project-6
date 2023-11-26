part of 'auth_bloc.dart';

abstract class AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String emailOrUsername;
  final String userName;
  final String pass;

  SignUpEvent(
      {required this.emailOrUsername,
      required this.userName,
      required this.pass});
}

class SignInEvent extends AuthEvent {
  final String emailOrUsername;
  final String pass;

  SignInEvent({required this.emailOrUsername, required this.pass});
}
