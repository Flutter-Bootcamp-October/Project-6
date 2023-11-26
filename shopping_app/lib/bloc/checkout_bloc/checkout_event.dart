abstract class CheckoutEvent {
  final int choise;

  CheckoutEvent(this.choise);
}

class ChooseAdreesEvent extends CheckoutEvent {
  ChooseAdreesEvent(super.choise);
}

class ChoosePaymentEvent extends CheckoutEvent {
  ChoosePaymentEvent(super.choise);
}
