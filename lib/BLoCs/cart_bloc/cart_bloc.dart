import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wach_store_app/BLoCs/cart_bloc/cart_event.dart';
import 'package:wach_store_app/BLoCs/cart_bloc/cart_state.dart';
import 'package:wach_store_app/global/global.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<AddWatchFromHomeEvent>(
      (event, emit) {
        if (!orderProducts.contains(event.watch)) {
          orderProducts.add(event.watch);
          event.watch.count = 1;
        } else {
          event.watch.count = event.watch.count! + 1;
        }
      },
    );
    on<DeleteWatchEvent>(
      (event, emit) {
        globalPrice = globalPrice -
            (double.parse(event.watch.price!) * event.watch.count!);
        orderProducts.remove(event.watch);
        copun = '';
        emit(DeleteWatchState());
      },
    );

    on<IncrementWatchEvent>((event, emit) {
      globalPrice += double.parse(event.watch.price!);
      if (!orderProducts.contains(event.watch)) {
        orderProducts.add(event.watch);
        event.watch.count = 1;
      }
      event.watch.count = event.watch.count! + 1;
      globalPrice += double.parse(event.watch.price!);
      emit(IncrementWatchState(total: globalPrice, count: event.watch.count!));
    });

    on<DecrementWatchEvent>((event, emit) {
      if (event.watch.count! > 1) {
        event.watch.count = event.watch.count! - 1;
        globalPrice -= double.parse(event.watch.price!);
        emit(
            DecrementWatchState(total: globalPrice, count: event.watch.count!));
      } else if (event.watch.count! == 1) {
        globalPrice = globalPrice -
            (double.parse(event.watch.price!) * event.watch.count!);
        orderProducts.remove(event.watch);
        emit(
            DecrementWatchState(total: globalPrice, count: event.watch.count!));
      }
    });
    on<AddToCartEvent>((event, emit) {
      if (!orderProducts.contains(event.watch)) {
        orderProducts.add(event.watch);
        event.watch.count = 1;
      }
    });

    on<ChoosePaymentEvent>((event, emit) {
      if (event.option == 'mastercard') {
        emit(ChoosePaymentState(option: 'mastercard'));
      } else {
        emit(ChoosePaymentState(option: 'paypal'));
      }
    });

    // on<CopunEvent>((event, emit) {
    //   if (event.copun == 'Flutter') {
    //     copun = event.copun;
    //     discountAmount = globalPrice * 0.25;
    //     grandTotal = globalPrice * discount;
    //   } else {
    //     copun = '';
    //     grandTotal = globalPrice;
    //   }
    // });
  }
}
