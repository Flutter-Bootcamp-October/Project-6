import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/bloc/nav_bloc/nav_State.dart';
import 'package:shopping_app/bloc/nav_bloc/nav_event.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  NavBloc() : super(NavState(0)) {
    on<NavEvent>((event, emit) {
      emit(NavState(event.index));
    });
  }
}
