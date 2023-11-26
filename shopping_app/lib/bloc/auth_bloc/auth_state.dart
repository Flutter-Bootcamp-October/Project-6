abstract class AuthState {}

class InitialState extends AuthState {}

class SeccessAuth extends AuthState {}

class ErrorState extends AuthState {
  final String errorMsg;

  ErrorState(this.errorMsg);
}
