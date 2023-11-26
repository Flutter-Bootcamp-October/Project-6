abstract class SearchEvent {}

class SearchForWatchEvent extends SearchEvent {
  String watchName;
  SearchForWatchEvent({required this.watchName});
}

class ClearFieldEvent extends SearchEvent {}
