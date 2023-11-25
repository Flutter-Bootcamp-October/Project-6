import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/global/global.dart';
import 'package:shopping_app/models/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<IncreamentCountEvent>((event, emit) {
      emit(UpdateCountState(count: event.count + 1));
    });
    on<DecreamentCountEvent>((event, emit) {
      if (event.count > 1) {
        emit(UpdateCountState(count: event.count - 1));
      }
    });
    on<ChageRangeEvent>((event, emit) {
      emit(UpdateRangeState(currentRangeValues: event.currentRangeValues));
    });
    on<SelecCategoryEvent>((event, emit) {
      emit(ReturnSelectedCategoryState(category: event.category));
    });
    on<SelectSortEvent>((event, emit) {
      emit(ReturnSelectedSortState(sort: event.sort));
    });
    on<ApplyEvent>((event, emit) {
      List<Product> filteredList = [];
      if (event.categorySelected == 0) {
        for (var product in productList) {
          if (event.currentRangeValues.start < product.price &&
              event.currentRangeValues.end > product.price) {
            filteredList.add(product);
          }
        }
      } else if (event.categorySelected == 1) {
        for (var product in productList) {
          if (product.category == WatchCategory.metallic &&
              event.currentRangeValues.start < product.price &&
              event.currentRangeValues.end > product.price) {
            filteredList.add(product);
          }
        }
      } else if (event.categorySelected == 2) {
        for (var product in productList) {
          if (product.category == WatchCategory.leather &&
              event.currentRangeValues.start < product.price &&
              event.currentRangeValues.end > product.price) {
            filteredList.add(product);
          }
        }
      } else if (event.categorySelected == 4) {
        for (var product in productList) {
          if (product.category == WatchCategory.classic &&
              event.currentRangeValues.start < product.price &&
              event.currentRangeValues.end > product.price) {
            filteredList.add(product);
          }
        }
      }

      if (event.sortBy == 0) {
        filteredList.sort((a, b) => a.price.compareTo(b.price));
      } else if (event.sortBy == 1) {
        filteredList.sort((a, b) => a.rating.compareTo(b.rating));
      } else if (event.sortBy == 4) {
        filteredList.sort((a, b) => a.discount.compareTo(b.discount));
      }
      emit(ShowFilterdlistState(filteredList: filteredList));
    });
  }
}
