part of 'auth_bloc.dart';

abstract class AuthEvent {}

final class SignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  SignUpEvent(this.name, this.email, this.password);
}

final class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
}

final class UpdateProfileEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String phone;

  UpdateProfileEvent(this.name, this.email, this.password, this.phone);
}
