abstract class AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String userNameOrEmail;
  final String name;
  final String password;

  SignUpEvent(
      {required this.userNameOrEmail,
      required this.name,
      required this.password});
}

class SignInEvent extends AuthEvent {
  final String userNameOrEmail;
  final String password;

  SignInEvent({required this.userNameOrEmail, required this.password});
}
