sealed class AuthState {}

final class AuthInitialState extends AuthState {}

class AuthSuccessState extends AuthState {}

class AuthErrorState extends AuthState {}

class AuthEmptyState extends AuthState {}
