import 'package:bloc/bloc.dart';
import 'package:shopping_app/data/global.dart';
import 'package:shopping_app/models/product_model.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<FindSearchEvent>((event, emit) {
      List<Product> searchResults = productList
          .where((product) =>
              product.name.toLowerCase().contains(event.search.toLowerCase()))
          .toList();
      emit(SearchFindState(searchResults));
    });
  }
}
