import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_watch/data/global.dart';
import 'package:store_watch/models/product.dart';

part 'add_to_cart_event.dart';
part 'add_to_cart_state.dart';

class AddToCartBloc extends Bloc<AddToCartEvent, AddToCartState> {
  AddToCartBloc() : super(AddToCartInitial()) {
    on<AddProductTocartEvent>((event, emit) {
      if (!orderProducts.contains(event.pro)) {
        orderProducts.add(event.pro);
      }
    });
  }
}
