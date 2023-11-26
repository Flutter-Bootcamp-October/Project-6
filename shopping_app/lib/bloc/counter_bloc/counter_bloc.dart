import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/bloc/counter_bloc/counter_event.dart';
import 'package:shopping_app/bloc/counter_bloc/counter_state.dart';
import 'package:shopping_app/global/global.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(ChangeCounterState(1)) {
    on<IncreaseEvent>((event, emit) {
      emit(ChangeCounterState(event.count + 1));
    });

    on<DecreaseEvent>((event, emit) {
      if (event.count > 1) {
        emit(ChangeCounterState(event.count - 1));
      }
    });

    on<IncreaseCartEvent>((event, emit) {
      event.product.count++;
      emit(ChangeCounterState(event.product.count));
    });

    on<DecreaseCartEvent>((event, emit) {
      if (event.product.count > 1) {
        event.product.count--;
        emit(ChangeCounterState(event.product.count));
      } else {
        currentUser.cart.removeWhere((product) => product == event.product);
      }
    });
  }
}
