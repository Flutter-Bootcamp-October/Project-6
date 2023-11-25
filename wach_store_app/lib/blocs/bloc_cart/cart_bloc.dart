import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wach_store_app/blocs/bloc_cart/cart_event.dart';
import 'package:wach_store_app/blocs/bloc_cart/cart_state.dart';
import 'package:wach_store_app/global/global.dart';
import 'package:wach_store_app/models/wach_model.dart';
import 'package:wach_store_app/screens/checkout_screen.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc()
      : super(InitialCartState(
          globalPrice: 0.0,
          discountAmount: 0.0,
          grandTotal: 0.0,
          currentOption: options[0],
          cartProducts: [],
        )) {
    on<CartEvent>((event, emit) {
      on<AddToCartEvent>((event, emit) {
        WatchProduct watchProduct = cartProducts.firstWhere(
          (product) => product.name == event.product.name,
          orElse: () =>
              WatchProduct(image: '', name: '', price: '', description: ''),
        );
        if (watchProduct.name == '') {
          event.product.count = 1;
          cartProducts.add(event.product);
          if (event.product.price != null) {
            if (double.tryParse(event.product.price!) != null) {
              globalPrice += double.tryParse(event.product.price!)!;
              grandTotal = globalPrice;
            }
          }
          emit(CartUpdatedState(
            cartProducts: cartProducts,
            globalPrice: globalPrice,
            discountAmount: discountAmount,
            grandTotal: grandTotal,
            currentOption: state.currentOption,
          ));
        } else {
          watchProduct.count = (watchProduct.count ?? 0) + 1;
          if (watchProduct.price != null) {
            if (double.tryParse(watchProduct.price!) != null) {
              globalPrice += double.tryParse(watchProduct.price!)!;
              grandTotal = globalPrice;
            }
          }
          emit(CartUpdatedState(
            cartProducts: cartProducts,
            globalPrice: globalPrice,
            discountAmount: discountAmount,
            grandTotal: grandTotal,
            currentOption: state.currentOption,
          ));
        }
      });
      on<DecreseCartEvent>((event, emit) {
        WatchProduct watchProduct = cartProducts.firstWhere(
          (product) => product.name == event.product.name,
          orElse: () =>
              WatchProduct(image: '', name: '', price: '', description: ''),
        );

        if (watchProduct.count! > 1) {
          watchProduct.count = watchProduct.count! - 1;

          if (double.tryParse(watchProduct.price!) != null) {
            globalPrice = globalPrice -
                (double.tryParse(watchProduct.price!)! * watchProduct.count!);
            grandTotal = globalPrice;
          }
          emit(CartUpdatedState(
            globalPrice: state.globalPrice,
            discountAmount: state.discountAmount,
            grandTotal: state.grandTotal,
            currentOption: state.currentOption,
            cartProducts: cartProducts,
          ));
        } else {
          cartProducts.remove(event.product);
          if (cartProducts.isNotEmpty) {
            if (double.tryParse(event.product.price!) != null) {
              globalPrice = globalPrice -
                  (double.tryParse(event.product.price!)! *
                      event.product.count!);
              grandTotal = globalPrice;
            }
            emit(CartUpdatedState(
              globalPrice: state.globalPrice,
              discountAmount: state.discountAmount,
              grandTotal: state.globalPrice,
              currentOption: state.currentOption,
              cartProducts: cartProducts,
            ));
          } else {
            if (double.tryParse(event.product.price!) != null) {
              globalPrice = 0.0;
              grandTotal = globalPrice;
            }
            emit(CartUpdatedState(
              globalPrice: globalPrice,
              discountAmount: discountAmount,
              grandTotal: globalPrice,
              currentOption: state.currentOption,
              cartProducts: cartProducts,
            ));
          }
        }
      });

      on<RemoveFromCartEvent>((event, emit) {
        cartProducts.remove(event.product);
        if (double.tryParse(event.product.price!) != null) {
          globalPrice = globalPrice -
              (double.tryParse(event.product.price!)! * event.product.count!);
          grandTotal = globalPrice;
        }
        emit(CartUpdatedState(
          globalPrice: state.globalPrice,
          discountAmount: state.discountAmount,
          grandTotal: state.grandTotal,
          currentOption: state.currentOption,
          cartProducts: cartProducts,
        ));
      });
      on<ApplyCouponEvent>((event, emit) {
        if (event.coupon == 'Flutter') {
          discountAmount = globalPrice * 0.25;
          grandTotal = globalPrice * discount;
        } else {
          grandTotal = globalPrice;
        }
        emit(CartUpdatedState(
          globalPrice: state.globalPrice,
          discountAmount: state.discountAmount,
          grandTotal: state.grandTotal,
          currentOption: state.currentOption,
          cartProducts: cartProducts,
        ));
      });
    });
  }
}
