part of 'search_bloc.dart';

abstract class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchFoundState extends SearchState {
  final Product product;
  final bool found;
  SearchFoundState(this.product, this.found);
}

final class SearchNotFoundState extends SearchState {
  final bool found;
  SearchNotFoundState(this.found);
}
