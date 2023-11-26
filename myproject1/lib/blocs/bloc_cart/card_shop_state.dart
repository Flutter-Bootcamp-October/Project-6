part of 'card_shop_bloc.dart';

@immutable
sealed class CardShopState {
  final double globalPrice;

  const CardShopState({required this.globalPrice});
}

final class CardShopInitial extends CardShopState {
  const CardShopInitial() : super(globalPrice: 0);
}

class UpdateCart extends CardShopState {
  const UpdateCart({required double globalPrice})
      : super(globalPrice: globalPrice);
}

class IncreaseCart extends CardShopState {
  const IncreaseCart({required double globalPrice})
      : super(globalPrice: globalPrice);
}
