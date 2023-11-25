import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/global.dart';
import '../../../models/product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<AddCartEvent>((event, emit) {
      if (!orderProducts.contains(event.product)) {
        orderProducts.add(event.product);
      } else {
        event.product.count = event.product.count! + 1;
      }
    });
    on<IncreaseEvent>((event, emit) {
      double price = double.parse(event.product.price);
      event.product.count = event.product.count + 1;

      price =
          (double.parse(event.product.price) * event.product.count.toDouble());
      emit(PriceState(price));
    });
    on<DecreaseEvent>((event, emit) {
      double price = double.parse(event.product.price);
      if (event.product.count! > 1) {
        event.product.count = event.product.count - 1;
        price = (double.parse(event.product.price) *
            event.product.count.toDouble());
        emit(PriceState(price));
      }
    });
    on<DeleteCartEvent>((event, emit) {
      globalPrice = globalPrice -
          (double.parse(event.product.price) * event.product.count!);
      event.product.count = 0;
      orderProducts.remove(event.product);
      emit(CartInitial());
    });
    on<DecreaseDeleteEvent>((event, emit) {
      if (event.product.count! > 1) {
        event.product.count = event.product.count! - 1;
        globalPrice -= double.parse(event.product.price);
      } else if (event.product.count! == 1) {
        globalPrice = globalPrice -
            (double.parse(event.product.price) * event.product.count!);
        event.product.count = 0;
        orderProducts.remove(event.product);
      }
      emit(DeleteCartState());
    });
    on<RadioCartEvent>((event, emit) {
      if (event.value == 0) {
        event.value = 1;
        emit(RadioCartState(event.value));
      } else if (event.value == 1) {
        event.value = 0;
        emit(RadioCartState(event.value));
      }
    });
    on<FilterCartEvent>((event, emit) {
      switch (event.value) {
        case 0:
          {
            emit(CategoryCartState('All Watches'));
          }
          break;
        case 1:
          {
            emit(CategoryCartState('Metallic'));
          }
          break;
        case 2:
          {
            emit(CategoryCartState('Leather'));
          }
          break;
        case 3:
          {
            emit(CategoryCartState('Expensive'));
          }
          break;
        case 4:
          {
            emit(CategoryCartState('Classical'));
          }
          break;
      }
    });

    on<SortCartEvent>((event, emit) {
      switch (event.value) {
        case 0:
          {
            emit(SortCartState('price'));
          }
          break;
        case 1:
          {
            emit(SortCartState('Rating'));
          }
          break;
        case 2:
          {
            emit(SortCartState('popular'));
          }
          break;
        case 3:
          {
            emit(SortCartState('popularity'));
          }
          break;
        case 4:
          {
            emit(SortCartState('Deals & Discounts'));
          }
          break;
      }
    });
  }
}
