
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_set.dart';
import '../../data/global.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<FindSearchEvent>((event, emit) {
      List<Map<String, dynamic>> searchResults = dataSets;
      searchResults = dataSets
          .where((product) => product["name"]
              .toString()
              .toLowerCase()
              .contains(event.search.toLowerCase()))
          .toList();
      emit(SearchFindState(searchResults));
    });
    on<UpdateProfileEvent>((event, emit) {
      if (event.name.isNotEmpty &&
          event.phone.isNotEmpty &&
          event.email.isNotEmpty &&
          event.password.isNotEmpty) {
        currentCustomer.name = event.name;
        currentCustomer.mobileNumber = int.parse(event.phone);
        currentCustomer.email = event.email;
        currentCustomer.password = event.password;
        emit(SuccessesState("Your profile was successfully updated"));
      } else {
        emit(ErrorState("Please complete all fields"));
      }
    });
  }
}
