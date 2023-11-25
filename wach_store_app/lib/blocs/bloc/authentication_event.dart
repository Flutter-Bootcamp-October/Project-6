
abstract class AuthenticationEvent {}

class SignUpEvent extends AuthenticationEvent {
  final String name;
  final String email;
  final String password;

  SignUpEvent(this.name, this.email, this.password);
}

class SignInEvent extends AuthenticationEvent {
  final String email;
  final String password;

  SignInEvent(this.email, this.password);
}

class SignOutEvent extends AuthenticationEvent {}
