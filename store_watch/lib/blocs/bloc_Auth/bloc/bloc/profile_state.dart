part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitialState extends ProfileState {}

final class UpdateState extends ProfileState {
  final String messageSuccssed;

  UpdateState({required this.messageSuccssed});
}

final class ErrorState extends ProfileState {
  final String message;

  ErrorState({required this.message});
}
