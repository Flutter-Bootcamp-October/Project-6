part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class UpdateEvent extends ProfileEvent {
  final String name;
  final String number;
  final String email;
  final String pass;

  UpdateEvent(
      {required this.name,
      required this.number,
      required this.email,
      required this.pass});
}
