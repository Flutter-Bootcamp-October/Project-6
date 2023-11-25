import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopingpriject/blocs/bloc/bloc3/bloc/order_event.dart';
import 'package:shopingpriject/blocs/bloc/bloc3/bloc/order_state.dart';
import 'package:shopingpriject/data/global.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<IncreaseEvent>((event, emit) {
      event.product.count = event.product.count! + 1;
      emit(OrderUpdatedState());
    });

    on<DencreaseEvent>((event, emit) {
      if (event.product.count! > 0) {
        event.product.count = event.product.count! - 1;
        if (event.product.count == 0) {
          orderProuct.remove(event.product);
        }
        emit(OrderUpdatedState());
      }
    });

    on<AddEvent>((event, emit) {
      orderProuct.add(event.product);
      emit(OrderUpdatedState());
    });

    on<DeleteEvent>((event, emit) {
      orderProuct.remove(event.product);

      emit(OrderUpdatedState());
    });
    on<RemoveProductEvent>((event, emit) {
      event.product.count = 0;
      globalPrice = globalPrice -
          (double.parse(event.product.price) * event.product.count!);
      orderProuct.remove(event.product);
      emit(OrderUpdatedState());
    });
       on<AddToOrderEvent>((event, emit) {
      if (!orderProuct.contains(event.product)) {
        orderProuct.add(event.product);
        event.product.count = event.product.count! + 1;
      } else {
        event.product.count = event.product.count! + 1;
      }
      emit(OrderUpdatedState());
    });
  }
}
