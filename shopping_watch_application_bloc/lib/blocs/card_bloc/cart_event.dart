import 'package:shopping_watch_application_bloc/Model/watch_product_model.dart';

abstract class CartEvent {
  Watch watch;

  CartEvent(this.watch);
}

class IncreaseEvent extends CartEvent {
  IncreaseEvent(super.watch);
}

class DecreaseEvent extends CartEvent {
  DecreaseEvent(super.watch);
}

class AddProductEvent extends CartEvent {
  AddProductEvent(super.watch);
}

class DeleteCartEvent extends CartEvent {
  DeleteCartEvent(super.watch);
}
