import 'package:wach_store_app/models/wach_model.dart';

class CartState {
  final double globalPrice;
  final double discountAmount;
  final double grandTotal;
  final String currentOption;
  final List<WatchProduct> cartProducts;

  CartState({
    required this.globalPrice,
    required this.discountAmount,
    required this.grandTotal,
    required this.currentOption,
    required this.cartProducts,
  });
}

class InitialCartState extends CartState {
  InitialCartState(
      {required super.globalPrice,
      required super.discountAmount,
      required super.grandTotal,
      required super.currentOption,
      required super.cartProducts});
}

class CartUpdatedState extends CartState {
  CartUpdatedState(
      {required super.globalPrice,
      required super.discountAmount,
      required super.grandTotal,
      required super.currentOption,
      required super.cartProducts});
}
