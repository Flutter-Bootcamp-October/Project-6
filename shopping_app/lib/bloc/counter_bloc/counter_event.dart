import 'package:shopping_app/models/product_model.dart';

abstract class CounterEvent {}

class IncreaseEvent extends CounterEvent {
  final int count;

  IncreaseEvent(this.count);
}

class DecreaseEvent extends CounterEvent {
  final int count;

  DecreaseEvent(this.count);
}

class IncreaseCartEvent extends CounterEvent {
  final Product product;

  IncreaseCartEvent(this.product);
}

class DecreaseCartEvent extends CounterEvent {
  final Product product;

  DecreaseCartEvent(this.product);
}
