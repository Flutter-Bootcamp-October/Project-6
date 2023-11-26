abstract class AuthEvent {
  final String email;
  final String password;

  AuthEvent(this.email, this.password);
}

class SignupEvent extends AuthEvent {
  final String name;
  SignupEvent(super.email, super.password, this.name);
}

class SigninEvent extends AuthEvent {
  SigninEvent(super.email, super.password);
}
