import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_watch/data/global.dart';
import 'package:store_watch/models/product.dart';

part 'detail_product_event.dart';
part 'detail_product_state.dart';

class DetailProductBloc extends Bloc<DetailProductEvent, DetailProductState> {
  DetailProductBloc() : super(DetailProductInitial()) {
    on<IncreaseCountEvent>((event, emit) {
      globalPrice += double.parse(event.pro.price);
      int count = event.pro.count += 1;
      // count += 1;
      emit(IncreaseState(count: count, price: globalPrice));
    });

    on<DecreaseCountEvent>((event, emit) {
      int count = event.pro.count;
      if (count > 0) {
        globalPrice -= double.parse(event.pro.price);
        count = event.pro.count -= 1;
        emit(DecreaseState(count: count, price: globalPrice));
      }
    });
  }
}
