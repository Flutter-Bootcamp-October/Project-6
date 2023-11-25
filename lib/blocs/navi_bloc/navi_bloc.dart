import 'package:flutter_bloc/flutter_bloc.dart';
part 'navi_event.dart';
part 'navi_state.dart';

class NaviBloc extends Bloc<NaviEvent, NaviState> {
  NaviBloc() : super(NaviInitial()) {
    on<PageNaviEvent>((event, emit) {
      switch (event.page) {
        case 0:
          {
            emit(PageNaviState(page: 0));
          }
          break;
        case 1:
          {
            emit(PageNaviState(page: 1));
          }
          break;
        case 2:
          {
            emit(PageNaviState(page: 2));
          }
          break;
        case 3:
          {
            emit(PageNaviState(page: 3));
          }
          break;
      }
    });
  }
}
