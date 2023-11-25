import 'package:flutter_bloc/flutter_bloc.dart';

part 'nav_bloc_event.dart';
part 'nav_bloc_state.dart';

class NavBloc extends Bloc<NavBlocEvent, NavBlocState> {
  NavBloc() : super(GetTabState(index: 0)) {
    on<TabEvent>((event, emit) {
      emit(GetTabState(index: event.index));
    });
  }
}
