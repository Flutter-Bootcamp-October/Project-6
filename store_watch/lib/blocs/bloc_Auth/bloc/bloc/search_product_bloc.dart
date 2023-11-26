import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_watch/data/data_set.dart';

part 'search_product_event.dart';
part 'search_product_state.dart';

class SearchProductBloc extends Bloc<SearchProductEvent, SearchProductState> {
  SearchProductBloc() : super(SearchProductInitialState()) {
    on<SearchEvent>((event, emit) {
      List<Map<String, dynamic>> searchResults = dataSets;
        searchResults = dataSets
            .where((product) => product["name"]
                .toString()
                .toLowerCase()
                .contains(event.query.toLowerCase()))
            .toList();

      emit(SearchState(searchResults: searchResults));
    });
  }
}
