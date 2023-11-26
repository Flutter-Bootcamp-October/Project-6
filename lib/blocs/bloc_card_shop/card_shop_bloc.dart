import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/data/global.dart';
import 'package:shopping_app/models/product_model.dart';

part 'card_shop_event.dart';
part 'card_shop_state.dart';

class CardShopBloc extends Bloc<CardShopEvent, CardShopState> {
  CardShopBloc() : super(CardShopInitial()) {
    on<AddToCart>((event, emit) {
      currentUser.cart.add(event.product);
      emit(UpdateCart());
    });

    on<RemoveFromCart>((event, emit) {
      currentUser.cart.remove(event.product);

      emit(UpdateCart());
    });

    on<IncreaseTheCounter>((event, emit) {
      event.product.count = event.product.count + 1;
      emit(UpdateCart());
    });

    on<DecreaseTheCounter>((event, emit) {
      if (event.product.count > 0) {
        event.product.count = event.product.count - 1;
      } else {
        currentUser.cart.remove(event.product);
      }
      emit(UpdateCart());
    });
    on<OnlyUpdate>((event, emit) {
      emit(UpdateCart());
    });
  }
}
