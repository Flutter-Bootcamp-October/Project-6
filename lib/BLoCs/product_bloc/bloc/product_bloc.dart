import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wach_store_app/BLoCs/product_bloc/bloc/product_event.dart';
import 'package:wach_store_app/BLoCs/product_bloc/bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitialState()) {
    on<ProductEvent>((event, emit) {});
  }
}
