import 'package:bloc/bloc.dart';
import 'package:watch_store/global/global.dart';
import 'package:watch_store/models/product.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchEvent>((event, emit) {
      bool found = false;
      for (var product in listProducts) {
        if (product.name.toLowerCase() == event.productName.toLowerCase()) {
          emit(SearchFoundState(product, true));
          found = true;
        }
      }
      if (!found) {
        emit(SearchNotFoundState(false));
      }
    });
  }
}
