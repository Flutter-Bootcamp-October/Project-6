import 'package:bloc/bloc.dart';
import 'package:store_watch/data/data_set.dart';
import 'package:store_watch/data/global.dart';
import 'package:store_watch/models/product.dart';

part 'display_detail_event.dart';
part 'display_detail_state.dart';

class DisplayDetailBloc extends Bloc<DisplayDetailEvent, DisplayDetailState> {
  DisplayDetailBloc() : super(DisplayDetailInitialState()) {
    on<ProductDetailDisplayEvent>((event, emit) {
      emit(ProductDetailDisplayState(product: event.product));
      emit(LoadedData(products: listProduct));
    });

    on<GetDataEvent>((event, emit) {
      for (var element in dataSets) {
        listProduct.add(Product.fromJson(element));
      }
      emit(LoadedData(products: listProduct));
    });
  }
}
