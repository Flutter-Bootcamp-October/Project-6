part of 'detail_product_bloc.dart';

@immutable
sealed class DetailProductState {}

final class DetailProductInitial extends DetailProductState {}

final class IncreaseState extends DetailProductState {
  final double price;
  final int count;

  IncreaseState({required this.count, required this.price});
}

final class DecreaseState extends DetailProductState {
  final double price;
  final int count;

  DecreaseState({required this.count, required this.price});
}
