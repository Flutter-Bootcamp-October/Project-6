abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchForWatchState extends SearchState {
  String query;

  SearchForWatchState({required this.query});
}

class ClearFieldState extends SearchState {
  bool isFocused;
  String field;

  ClearFieldState({required this.isFocused, required this.field});
}
