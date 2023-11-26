import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/bloc/checkout_bloc/checkout_event.dart';
import 'package:shopping_app/bloc/checkout_bloc/checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(ChangeAddressState(0)) {
    on<ChooseAdreesEvent>((event, emit) {
      emit(ChangeAddressState(event.choise));
    });
    on<ChoosePaymentEvent>((event, emit) {
      emit(ChangePaymentState(event.choise));
    });

    
  }
}
