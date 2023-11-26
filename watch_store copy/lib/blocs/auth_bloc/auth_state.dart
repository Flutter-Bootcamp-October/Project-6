part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class ErrorState extends AuthState {
  final String massege;

  ErrorState(this.massege);
}

final class SignUpState extends AuthState {}

final class LoginState extends AuthState {}

final class UpdateProfileState extends AuthState {
  final String massege;

  UpdateProfileState(this.massege);
}
