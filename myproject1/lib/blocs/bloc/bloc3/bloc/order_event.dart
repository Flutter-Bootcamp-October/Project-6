import 'package:shopingpriject/models/product_model.dart';

abstract class OrderEvent {
  final Product product;

  OrderEvent(this.product);
}

class IncreaseEvent extends OrderEvent {
  IncreaseEvent(super.product);
}

class DencreaseEvent extends OrderEvent {
  DencreaseEvent(super.product);
}

class AddEvent extends OrderEvent {
  AddEvent(super.product);
}

class DeleteEvent extends OrderEvent {
  DeleteEvent(super.product);
}

class RemoveProductEvent extends OrderEvent {
  RemoveProductEvent(super.product);
}

class AddToOrderEvent extends OrderEvent {
  AddToOrderEvent(super.product);
}
