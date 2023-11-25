import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopingpriject/blocs/bloc/bloc4/bloc/coupon_event.dart';
import 'package:shopingpriject/blocs/bloc/bloc4/bloc/coupon_state.dart';
import 'package:shopingpriject/data/global.dart';

class CouponBloc extends Bloc<CouponEvent, CouponState> {
  CouponBloc() : super(CouponNotAppliedState()) {
    on<ApplyCouponEvent>((event, emit) {
      if (event.couponCode == 'CODE10') {
        emit(CouponAppliedState(globalPrice * 0.1));
      } else if (event.couponCode != 'CODE10') {
        emit(CouponErrorState("Invalid Coupon Code"));
      }
    });
  }
}
