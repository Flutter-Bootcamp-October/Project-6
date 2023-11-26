abstract class ProfileState {}

final class ProfileUpdateInitial extends ProfileState {}

final class SuccessState extends ProfileState {
  final String successMessage;

  SuccessState({required this.successMessage});
}

final class ErrorState extends ProfileState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}
