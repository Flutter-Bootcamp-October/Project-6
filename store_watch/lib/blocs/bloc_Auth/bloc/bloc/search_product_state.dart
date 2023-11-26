part of 'search_product_bloc.dart';

@immutable
sealed class SearchProductState {}

final class SearchProductInitialState extends SearchProductState {}

class SearchState extends SearchProductState {
  final List<Map<String, dynamic>> searchResults;

  SearchState({required this.searchResults});
}
