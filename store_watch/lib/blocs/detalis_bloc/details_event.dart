import 'package:store_watch/models/product.dart';

abstract class DetailEvent {
  final Product product;

  DetailEvent({required this.product});
}

class AddEvent extends DetailEvent {
  AddEvent({required super.product});
}

class IncreasEvent extends DetailEvent {
  IncreasEvent({required super.product});
}

class DecreasEvent extends DetailEvent {
  DecreasEvent({required super.product});
}
