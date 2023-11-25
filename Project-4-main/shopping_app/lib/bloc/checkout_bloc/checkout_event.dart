part of 'checkout_bloc.dart';

abstract class CheckoutEvent {}

final class ChangeAddressEvent extends CheckoutEvent {
  final int selectedAdress;

  ChangeAddressEvent({required this.selectedAdress});
}

final class ChangePaymentEvent extends CheckoutEvent {
  final int selectedPayment;

  ChangePaymentEvent({required this.selectedPayment});
}

final class PlaceOrderEvent extends CheckoutEvent {
  final int selectedAdress;
  final int selectedPayment;

  PlaceOrderEvent(
      {required this.selectedAdress, required this.selectedPayment});
}
