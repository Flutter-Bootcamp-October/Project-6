import 'package:wach_store_app/models/wach_model.dart';

abstract class CartEvent {}

class AddToCartEvent extends CartEvent {
  final WatchProduct product;
 final int count;
  AddToCartEvent(this.product, this.count);
}

class RemoveFromCartEvent extends CartEvent {
  final WatchProduct product;
 

  RemoveFromCartEvent(this.product);
}
class DecreseCartEvent extends CartEvent {
  final WatchProduct product;
 final int count;

  DecreseCartEvent(this.product, this.count);
}
class ClearCartEvent extends CartEvent {}

class UpdatePaymentOptionEvent extends CartEvent {
  final String paymentOption;

  UpdatePaymentOptionEvent(this.paymentOption);
}

class ApplyCouponEvent extends CartEvent {
  final String coupon;

  ApplyCouponEvent(this.coupon);
}

class PlaceOrderEvent extends CartEvent {
   final WatchProduct product;

  PlaceOrderEvent(this.product);
}