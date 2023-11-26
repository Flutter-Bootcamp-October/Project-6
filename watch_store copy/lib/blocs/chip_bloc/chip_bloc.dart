import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chip_event.dart';
part 'chip_state.dart';

class ChipBloc extends Bloc<ChipEvent, ChipState> {
  ChipBloc() : super(ChipInitial()) {
    on<ChipUpdateEvent>((event, emit) {
      emit(ChipUpdateState(event.index));
    });
  }
}
