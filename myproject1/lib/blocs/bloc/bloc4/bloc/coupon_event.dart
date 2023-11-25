abstract class CouponEvent {}

class ApplyCouponEvent extends CouponEvent {
  final String couponCode;

  ApplyCouponEvent(this.couponCode);
}
