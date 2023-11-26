abstract class CartState {
  final num counter;

  CartState({required this.counter});
}

class InitialCartState extends CartState {
  InitialCartState({required super.counter});
}

class UpdateCartState extends CartState {
  UpdateCartState({required super.counter});
}

class UpdateCountState extends CartState {
  UpdateCountState({required super.counter});
}

class CounterState extends CartState {
  CounterState({required super.counter});
}

class CheckoutCartState extends CartState {
  CheckoutCartState({required super.counter});
}

class CartErrorState extends CartState {
  final String message;
  CartErrorState({required this.message, required super.counter});
}
