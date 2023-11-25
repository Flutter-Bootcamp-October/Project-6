import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopingpriject/blocs/bloc/bloc5/bloc/detail_event.dart';
import 'package:shopingpriject/blocs/bloc/bloc5/bloc/detail_state.dart';
import 'package:shopingpriject/data/global.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(InitialDetailState()) {
    on<AddToCartEvent>((event, emit) {
      try {
        if (!orderProuct.contains(event.product)) {
          orderProuct.add(event.product);
          event.product.count = event.product.count! + 1;
        } else {
          event.product.count = event.product.count! + 1;
        }
        emit(ProductAddedState(event.product));
      } catch (e) {
        emit(DetailErrorState('Error: $e'));
      }
    });
  }
}
