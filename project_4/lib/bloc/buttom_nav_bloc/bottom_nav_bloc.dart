import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavInitial(selectedIndex: 0)) {
    on<ChangeIndexEvent>((event, emit) {
      emit(ChangeIndexState(selectedIndex: event.index));
    });
  }
}
