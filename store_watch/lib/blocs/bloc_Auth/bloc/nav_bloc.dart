import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'nav_event.dart';
part 'nav_state.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  NavBloc() : super(NavInitialState(indexPage: 0)) {
    on<ClickNavEvent>((event, emit) {
      emit(NavInitialState(indexPage: event.clickIndex));
    });
  }
}