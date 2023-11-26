part of 'search_bloc.dart';

abstract class SearchEvent {}

class FindSearchEvent extends SearchEvent {
  final String search;
  final Product product;

  FindSearchEvent(this.search, this.product);
}
