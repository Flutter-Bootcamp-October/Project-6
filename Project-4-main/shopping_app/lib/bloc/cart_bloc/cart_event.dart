part of 'cart_bloc.dart';

abstract class CartEvent {
  void add(ViewCartEvent viewCartEvent) {}
}

class AddToCartEvent extends CartEvent {
  final int count;
  final Product product;
  AddToCartEvent({required this.count, required this.product});
}

class IncreamentProductCountEvent extends CartEvent {
  final Product product;

  IncreamentProductCountEvent({required this.product});
}

class DecreamentProductCountEvent extends CartEvent {
  final Product product;

  DecreamentProductCountEvent({required this.product});
}

class ViewCartEvent extends CartEvent {}
