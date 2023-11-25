abstract class AuthenticationState {}

class InitialAuthenticationState extends AuthenticationState {}

final class SignUpSuccessedState extends AuthenticationState {}


final class ErrorState extends AuthenticationState {
  final String massege;

  ErrorState(this.massege);
}


final class LoginSuccessedState extends AuthenticationState {}