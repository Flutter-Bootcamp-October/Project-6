part of 'display_detail_bloc.dart';

abstract class DisplayDetailEvent {}

class ProductDetailDisplayEvent extends DisplayDetailEvent {
  final Product product;
  ProductDetailDisplayEvent({required this.product});
}

class GetDataEvent extends DisplayDetailEvent {}
