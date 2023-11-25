part of 'cart_bloc.dart';

abstract class CartState {
  final num counter;

  CartState({required this.counter});
}

class CartInitialState extends CartState {
  CartInitialState({required super.counter});
}

class CartIncreaseState extends CartState {
  CartIncreaseState({required super.counter});
}

class CartDecreaseState extends CartState {
  CartDecreaseState({required super.counter});
}

class CartAddState extends CartState {
  CartAddState({required super.counter});
}

class CartRemoveState extends CartState {
  CartRemoveState({required super.counter});
}

class CartClearState extends CartState {
  final double total;
  CartClearState({required super.counter, required this.total});
}

class CartChangeCountState extends CartState {
  // final int count;
  CartChangeCountState({required super.counter});
}
