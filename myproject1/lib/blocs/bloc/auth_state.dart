abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUpSuccessedState extends AuthState {}

final class ErrorState extends AuthState {
  final String message;

  ErrorState(this.message);
}

final class SignInSuccessedState extends AuthState {}
