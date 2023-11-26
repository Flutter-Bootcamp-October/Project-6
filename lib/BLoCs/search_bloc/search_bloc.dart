import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wach_store_app/BLoCs/search_bloc/search_event.dart';
import 'package:wach_store_app/BLoCs/search_bloc/search_state.dart';
import 'package:wach_store_app/global/global.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<ClearFieldEvent>((event, emit) {
      emit(ClearFieldState(isFocused: false, field: ''));
    });

    on<SearchForWatchEvent>((event, emit) {
      if (event.watchName.isEmpty) filteredWachList.clear();
      emit(SearchForWatchState(query: event.watchName));
    });
  }
}
