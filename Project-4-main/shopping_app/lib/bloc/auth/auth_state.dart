abstract class AuthState {}

class InitialAuthState extends AuthState {}

class SignUpSuccessState extends AuthState {}

class SignInSuccessState extends AuthState {}

class UpdateSuccessState extends AuthState {}

class AuthErrorState extends AuthState {
  final String message;
  AuthErrorState({required this.message});
}
