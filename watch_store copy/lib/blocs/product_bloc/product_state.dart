part of 'product_bloc.dart';

abstract class ProductState {}

final class ProductInitial extends ProductState {
  
}

final class CartUpdatedState extends ProductState {
  final Product product;
  final String massege;

  CartUpdatedState(this.product, this.massege);
}

final class AdrressAddedState extends ProductState {}
