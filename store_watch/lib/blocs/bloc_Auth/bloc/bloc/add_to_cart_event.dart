part of 'add_to_cart_bloc.dart';

abstract class AddToCartEvent {}

class AddProductTocartEvent extends AddToCartEvent {
  final Product pro;

  AddProductTocartEvent({required this.pro});
}
