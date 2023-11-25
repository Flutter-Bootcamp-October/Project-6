part of 'search_bloc.dart';

abstract class SearchEvent {}

class FindSearchEvent extends SearchEvent {
  final String search;

  FindSearchEvent(this.search);
}

class UpdateProfileEvent extends SearchEvent {
  final String name;
  final String phone;
  final String email;
  final String password;

  UpdateProfileEvent(this.name, this.phone, this.email, this.password);
}
