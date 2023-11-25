abstract class CouponState {}

class CouponAppliedState extends CouponState {
  final double discountAmount;

  CouponAppliedState(this.discountAmount);
}

class CouponNotAppliedState extends CouponState {}

class CouponErrorState extends CouponState {
  final String errorMessage;

  CouponErrorState(this.errorMessage);
}
