abstract class AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  SignUpEvent(
      {required this.name, required this.email, required this.password});
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;
  SignInEvent({required this.email, required this.password});
}

class UpdateProfileEvent extends AuthEvent {
  final String name;
  final String phone;
  final String email;
  final String password;

  UpdateProfileEvent(
      {required this.name,
      required this.phone,
      required this.email,
      required this.password});
}
