part of 'detail_product_bloc.dart';

abstract class DetailProductEvent {}

class IncreaseCountEvent extends DetailProductEvent {
  final Product pro;

  IncreaseCountEvent({required this.pro});
}

class DecreaseCountEvent extends DetailProductEvent {
  final Product pro;

  DecreaseCountEvent({required this.pro});
}
