part of 'display_detail_bloc.dart';

abstract class DisplayDetailState {}

final class DisplayDetailInitialState extends DisplayDetailState {}

final class ProductDetailDisplayState extends DisplayDetailState {
  final Product product;
  ProductDetailDisplayState({required this.product});
}

final class LoadedData extends DisplayDetailState {
  final List<Product> products;
  LoadedData({required this.products});
}
