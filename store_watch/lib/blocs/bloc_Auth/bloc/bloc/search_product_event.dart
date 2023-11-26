part of 'search_product_bloc.dart';

abstract class SearchProductEvent {}

class SearchEvent extends SearchProductEvent {
  String query;
  SearchEvent({this.query = ''});
}
