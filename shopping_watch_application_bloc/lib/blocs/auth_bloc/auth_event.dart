abstract class AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String fullName;
  final String email;
  final String password;

  SignUpEvent(this.email, this.fullName, this.password);
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  SignInEvent(this.email, this.password);
}
