part of 'cart_bloc.dart';

abstract class CartEvent {}

class IncreaseEvent extends CartEvent {
  final Product product;

  IncreaseEvent(this.product);
}

class DecreaseEvent extends CartEvent {
  final Product product;

  DecreaseEvent(
    this.product,
  );
}

class AddCartEvent extends CartEvent {
  final Product product;

  AddCartEvent(this.product);
}

class DecreaseDeleteEvent extends CartEvent {
  final Product product;

  DecreaseDeleteEvent(this.product);
}

class DeleteCartEvent extends CartEvent {
  final Product product;

  DeleteCartEvent({required this.product});
}

class RadioCartEvent extends CartEvent {
  int value;

  RadioCartEvent(
    this.value,
  );
}

class FilterCartEvent extends CartEvent {
  final int value;

  FilterCartEvent(
    this.value,
  );
}

class SortCartEvent extends CartEvent {
  final int value;

  SortCartEvent(
    this.value,
  );
}
