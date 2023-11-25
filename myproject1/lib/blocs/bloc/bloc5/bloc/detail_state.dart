import 'package:shopingpriject/models/product_model.dart';

abstract class DetailState {}

class InitialDetailState extends DetailState {}

class ProductAddedState extends DetailState {
  final Product product;

  ProductAddedState(this.product);
}

class DetailErrorState extends DetailState {
  final String errorMessage;

  DetailErrorState(this.errorMessage);
}
