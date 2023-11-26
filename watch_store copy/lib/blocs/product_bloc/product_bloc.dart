import 'package:bloc/bloc.dart';
import 'package:watch_store/global/global.dart';
import 'package:watch_store/models/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<IncreaceProductEvent>((event, emit) {
      event.product.count = event.product.count! + 1;
      calculateTotalPrice();
      emit(CartUpdatedState(event.product, ""));
    });

    on<DecreceProductEvent>((event, emit) {
      if (event.product.count! > 1) {
        event.product.count = event.product.count! - 1;
        calculateTotalPrice();
        emit(CartUpdatedState(event.product, ""));
      } else if (event.product.count == 1) {
        if (currentUser.productList.contains(event.product)) {
          currentUser.productList.remove(event.product);
          calculateTotalPrice();
          emit(CartUpdatedState(event.product, ""));
        }
      }
    });

    on<AddProductEvent>((event, emit) {
      if (!currentUser.productList.contains(event.product)) {
        currentUser.productList.add(event.product);
        calculateTotalPrice();
        emit(CartUpdatedState(event.product, "Prodect added !"));
      } else {
        event.product.count = event.product.count! + 1;
        emit(CartUpdatedState(event.product, "Prodect added !"));
      }
    });
    on<AddAddressEvent>((event, emit) {
      if (event.address.isNotEmpty) {
        currentUser.location.add(event.address);

        emit(AdrressAddedState());
      }
    });
  }
  calculateTotalPrice() {
    currentUser.total = 0;
    for (var product in currentUser.productList) {
      currentUser.total =
          currentUser.total! + (product.count! * double.parse(product.price));
    }
  }
}
