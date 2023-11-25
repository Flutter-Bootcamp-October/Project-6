part of 'cart_bloc.dart';

abstract class CartState {}

final class CartInitial extends CartState {
  final double total = 0;
  final double discount = 0;
  final double ground = 0;
}

final class UpdateCartState extends CartState {
  final double total;
  final double discount;
  final double ground;

  UpdateCartState(
      {required this.total, required this.discount, required this.ground});
}

final class AddedTocartsucessState extends CartState {}

final class EmptyCartState extends CartState {}
