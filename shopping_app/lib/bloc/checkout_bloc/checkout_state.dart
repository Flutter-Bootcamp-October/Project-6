abstract class CheckoutState {
  final int choise;

  CheckoutState(this.choise);
}

class ChangeAddressState extends CheckoutState {
  ChangeAddressState(super.choise);
}

class ChangePaymentState extends CheckoutState {
  ChangePaymentState(super.choise);
}
