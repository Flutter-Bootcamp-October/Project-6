import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/global/global.dart';
import 'package:shopping_app/models/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<ViewCartEvent>((event, emit) {
      if (currentUser.cart.isEmpty) {
        emit(EmptyCartState());
      } else {
        emit(cartMath());
      }
    });
    on<AddToCartEvent>((event, emit) {
      event.product.count += event.count;
      if (!currentUser.cart.contains(event.product)) {
        currentUser.cart.add(event.product);
      } else {
        for (var prodect in currentUser.cart) {
          if (prodect == prodect) {
            prodect.count = prodect.count;
          }
        }
      }
      emit(AddedTocartsucessState());
    });
    on<IncreamentProductCountEvent>((event, emit) {
      event.product.count += 1;
      emit(cartMath());
    });
    on<DecreamentProductCountEvent>((event, emit) {
      if (event.product.count > 1) {
        event.product.count -= 1;
        emit(cartMath());
      } else if (event.product.count == 1) {
        event.product.count -= 1;
        currentUser.cart.remove(event.product);
        if (currentUser.cart.isEmpty) {
          emit(EmptyCartState());
        } else {
          emit(cartMath());
        }
      }
    });
  }
}

UpdateCartState cartMath() {
  double itemTotal = 0;
  double discount = 0;
  for (var product in currentUser.cart) {
    itemTotal += product.count * product.price;
    discount += product.count * product.price * product.discount;
  }
  double groundTotal = itemTotal - discount;
  return UpdateCartState(
      total: itemTotal, discount: discount, ground: groundTotal);
}
