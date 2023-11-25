import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/data/global_data.dart';
import 'package:project_4/models/watch_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState(counter: 1)) {
    on<CartIncreaseEvent>((event, emit) {
      event.watch.count = event.watch.count + 1;
      itemsTotal.value += event.watch.price;
      grandTotal.value = itemsTotal.value - discount;
      emit(CartIncreaseState(counter: event.watch.count));
    });

    on<CartDecreaseEvent>((event, emit) {
      if (event.watch.count == 1) {
        itemsTotal.value -= event.watch.price;
        grandTotal.value = (itemsTotal.value - discount);
        event.watch.count = 0;
        cartList.remove(event.watch);
        emit(CartRemoveState(counter: 1));
      } else {
        event.watch.count = event.watch.count - 1;
        itemsTotal.value -= event.watch.price;
        grandTotal.value = (itemsTotal.value - discount);
        emit(CartDecreaseState(counter: event.watch.count));
      }
    });

    on<CartAddEvent>((event, emit) {
      event.itemCount! > 1
          ? addItemToCartFromDetails(event.watch, event.itemCount!)
          : addItemToCart(event.watch);
      emit(CartAddState(counter: event.itemCount!));
    });

    on<CartRemoveEvent>((event, emit) {
      itemsTotal.value -= (event.watch.price * event.watch.count);
      grandTotal.value = itemsTotal.value - discount;
      event.watch.count = 0;
      cartList.remove(event.watch);
      emit(CartRemoveState(counter: 1));
    });

    on<CartClearEvent>((event, emit) {
      num numberOfPurchasedItems = 0;
      double totalBoughtCost = grandTotal.value;
      for (var items in cartList) {
        boughtItemsName.add(items.name);
        numberOfPurchasedItems = items.count;
        items.count = 0;
      }
      cartList.clear();
      itemsTotal.value = 0;
      grandTotal.value = 0;
      emit(CartClearState(counter: numberOfPurchasedItems, total: totalBoughtCost));
    });

    on<CartIncreaseCountEvent>((event, emit) {
      emit(CartChangeCountState(counter: state.counter + 1));
    });

    on<CartDecreaseCountEvent>((event, emit) {
      if (state.counter == 1) {
      } else {
        emit(CartChangeCountState(counter: state.counter - 1));
      }
    });
    on<CartResetCounter>((event, emit) {
      emit(CartChangeCountState(counter: 1));
    });
  }
}

void addItemToCart(Watch watch) {
  if (!cartList.contains(watch)) {
    cartList.add(watch);
    watch.count = watch.count + 1;
    itemsTotal.value += watch.price;
    grandTotal.value = itemsTotal.value;
  } else {
    watch.count = watch.count + 1;
    itemsTotal.value += watch.price;
    grandTotal.value = itemsTotal.value;
  }
}

void addItemToCartFromDetails(Watch watch, num count) {
  if (!cartList.contains(watch)) {
    cartList.add(watch);

    watch.count = watch.count + count;
    itemsTotal.value += watch.price * count;
    grandTotal.value = itemsTotal.value;
  } else {
    watch.count = watch.count + count;
    itemsTotal.value += watch.price * count;
    grandTotal.value = itemsTotal.value;
  }
}
