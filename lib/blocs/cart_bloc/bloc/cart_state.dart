part of 'cart_bloc.dart';

abstract class CartState {}

final class CartInitial extends CartState {}

final class IncreaseDecreaseStet extends CartState {
  final int count;
  final double globalPrice;

  IncreaseDecreaseStet(this.count, this.globalPrice);
}

final class PriceState extends CartState {
  final double price;

  PriceState(this.price);
}

class DeleteCartState extends CartState {}

final class RadioCartState extends CartState {
  final int value;

  RadioCartState(this.value);
}

final class CategoryCartState extends CartState {
  final String value;

  CategoryCartState(this.value);
}

final class SortCartState extends CartState {
  final String value;

  SortCartState(this.value);
}

final class PagesState extends CartState {
  final int value;

  PagesState(this.value);
}
