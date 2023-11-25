import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/global/global.dart';
import 'package:shopping_app/models/product_model.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutInitial()) {
    on<ChangeAddressEvent>((event, emit) {
      emit(ChangeAddressState(selectedAdress: event.selectedAdress));
    });
    on<ChangePaymentEvent>((event, emit) {
      emit(ChangePaymentState(selectedPayment: event.selectedPayment));
    });
    on<PlaceOrderEvent>((event, emit) {
      if (event.selectedPayment > -1) {
        print(currentUser.cart);
        for (Product product in currentUser.cart) {
          product.count = 0;
        }
        currentUser.cart = [];
        emit(OrderPlaceSuccessfuly());
      } else {
        emit(CheckoutErrorState());
      }
    });
  }
}
