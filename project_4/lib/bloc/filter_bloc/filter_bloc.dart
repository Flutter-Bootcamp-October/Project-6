import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterInitialState()) {
    on<FilterHomeSelectChipEvent>((event, emit) {
      emit(FilterHomeSelectChipState(index: event.index));
    });

    on<FilterSelectChipEvent>((event, emit) {
      emit(FilterChangedChipState(index: event.index));
    });

    on<FilterRangeEvent>((event, emit) {
      emit(FilterChangedRangeState(range: event.range));
    });
  }
}
