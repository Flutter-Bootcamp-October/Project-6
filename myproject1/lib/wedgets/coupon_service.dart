// coupon_service.dart
import 'coupon.dart';

class CouponService {
  Map<String, Coupon> _availableCoupons = {
    'DISCOUNT20': Coupon(code: 'DISCOUNT20', discount: 0.2),
    // Add more coupons here
  };

  Coupon? validateCoupon(String code) {
    return _availableCoupons[code];
  }
}
