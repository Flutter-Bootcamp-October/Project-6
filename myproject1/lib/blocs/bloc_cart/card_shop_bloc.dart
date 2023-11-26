import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopingpriject/data/global.dart';
import 'package:shopingpriject/models/product_model.dart';

part 'card_shop_event.dart';
part 'card_shop_state.dart';

class CardShopBloc extends Bloc<CardShopEvent, CardShopState> {
  CardShopBloc() : super(CardShopInitial()) {
    on<AddToCart>((event, emit) {
      listProucts.add(event.product);
      calculateAndEmitUpdateCart(emit);
    });

    on<RemoveFromCart>((event, emit) {
      listProucts.remove(event.product);
      calculateAndEmitUpdateCart(emit);
    });

    on<IncreaseTheCounter>((event, emit) {
      event.product.count = event.product.count! + 1;
      calculateAndEmitUpdateCart(emit);
    });

    on<DecreaseTheCounter>((event, emit) {
      if (event.product.count! > 1) {
        event.product.count = event.product.count! - 1;
      } else {
        listProucts.remove(event.product);
      }
      calculateAndEmitUpdateCart(emit);
    });
    on<ClearOrder>((event, emit) {
      // Reset the count to 0 and update the global price
      event.product.count = 0;
      calculateAndEmitUpdateCart(emit);
    });
  }

  void calculateAndEmitUpdateCart(Emitter<CardShopState> emit) {
    calculateGlobalPrice();
    emit(UpdateCart(globalPrice: globalPrice));
  }
}
