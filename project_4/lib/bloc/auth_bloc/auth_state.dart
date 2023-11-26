part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoginErrorState extends AuthState {
  final String errorMsg;

  AuthLoginErrorState({required this.errorMsg});
}

class AuthRegisterErrorState extends AuthState {
  final String errorMsg;

  AuthRegisterErrorState({required this.errorMsg});
}

class AuthSuccessState extends AuthState {}
