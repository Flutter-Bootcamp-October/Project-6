part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUpSuccessedState extends AuthState {}

final class SignInSuccessedState extends AuthState {}

final class ErrorState extends AuthState {
  //same SignIn &SignUp
  final String message;

  ErrorState({required this.message});
}
