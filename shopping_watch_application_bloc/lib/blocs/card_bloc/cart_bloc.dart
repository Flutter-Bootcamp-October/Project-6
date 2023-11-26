import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_watch_application_bloc/Data/global.dart';
import 'package:shopping_watch_application_bloc/blocs/card_bloc/cart_event.dart';
import 'package:shopping_watch_application_bloc/blocs/card_bloc/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(InitialCartState()) {
    on<AddProductEvent>((event, emit) {
      listOrderWatch.add(event.watch);
      emit(UpdateCartState());
    });

    on<IncreaseEvent>((event, emit) {
      event.watch.count = event.watch.count! + 1;
      emit(UpdateCartState());
    });

    on<DecreaseEvent>((event, emit) {
      if (event.watch.count! > 1) {
        event.watch.count = event.watch.count! - 1;
        emit(UpdateCartState());
      } else {
        delete(event, emit);
      }
    });
    on<DeleteCartEvent>(delete);
  }

  delete(event, emit) {
    listWatch.remove(event.watch);
    emit(UpdateCartState());
  }
}
