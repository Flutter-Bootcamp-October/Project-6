abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUpSuccessedState extends AuthState {}

final class SignInSuccessedState extends AuthState {}

final class ErrorState extends AuthState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}
