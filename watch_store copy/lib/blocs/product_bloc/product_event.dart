part of 'product_bloc.dart';

abstract class ProductEvent {}

final class IncreaceProductEvent extends ProductEvent {
  final Product product;

  IncreaceProductEvent(this.product);
}

final class DecreceProductEvent extends ProductEvent {
  final Product product;

  DecreceProductEvent(this.product);
}

final class AddProductEvent extends ProductEvent {
  final Product product;

  AddProductEvent(this.product);
}
final class AddAddressEvent extends ProductEvent {
  final String address;

  AddAddressEvent(this.address);

  
}