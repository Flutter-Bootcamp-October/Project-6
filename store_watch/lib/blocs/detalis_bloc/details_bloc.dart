import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_watch/blocs/detalis_bloc/details_event.dart';
import 'package:store_watch/blocs/detalis_bloc/details_state.dart';
import 'package:store_watch/data/global.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(InitialState()) {
    int count = 0;
    //double globalPrice = 0;
    on<IncreasEvent>((event, emit) {
      event.product.count = event.product.count + 1;
      dynamic count = event.product.count;
      globalPrice = (double.parse(event.product.price) * count.toDouble());
      emit(UpdatedCountState());
    });

    on<DecreasEvent>((event, emit) {
      if (event.product.count > 1) {
        event.product.count = event.product.count - 1;

        globalPrice = (double.parse(event.product.price) *
            event.product.count.toDouble());
      }
      emit(UpdatedCountState());
    });

    on<AddEvent>((event, emit) {
      if (!orderProducts.contains(event.product)) {
        orderProducts.add(event.product);
        event.product.count = event.product.count! + count;
      } else {
        event.product.count = event.product.count! + count;
      }
      emit(AddSuccessState());
    });
  }
}
