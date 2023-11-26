sealed class AuthEvent {}

class SignUpEvent extends AuthEvent {
  String email;
  String name;
  String password;

  SignUpEvent({
    required this.email,
    required this.name,
    required this.password,
  });
}

class SignInEvent extends AuthEvent {
  String email;
  String password;

  SignInEvent({
    required this.email,
    required this.password,
  });
}
