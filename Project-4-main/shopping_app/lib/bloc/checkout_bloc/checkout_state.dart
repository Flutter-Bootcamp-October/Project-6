part of 'checkout_bloc.dart';

abstract class CheckoutState {}

final class CheckoutInitial extends CheckoutState {
  final int selectedAdress = 0;
  final int selectedPayment = -1;
}

final class ChangeAddressState extends CheckoutState {
  final int selectedAdress;

  ChangeAddressState({required this.selectedAdress});
}

final class ChangePaymentState extends CheckoutState {
  final int selectedPayment;

  ChangePaymentState({required this.selectedPayment});
}

final class CheckoutErrorState extends CheckoutState {
  final String message = 'Please select a payment method';
}

final class OrderPlaceSuccessfuly extends CheckoutState {}
