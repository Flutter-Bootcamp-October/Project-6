abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUpSuccessedState extends AuthState {}

final class SiginSuccessedState extends AuthState {}

final class ErrorState extends AuthState {
  final String mesg;

  ErrorState(this.mesg);
}
