import 'package:shopingpriject/models/product_model.dart';

abstract class DetailEvent {}

class AddToCartEvent extends DetailEvent {
  final Product product;

  AddToCartEvent(this.product);
}
