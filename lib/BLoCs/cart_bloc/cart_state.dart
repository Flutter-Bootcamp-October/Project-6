abstract class CartState {}

class CartInitialState extends CartState {}

class AddWatchFromHomeState extends CartState {}

class AddWatchFromDetailsState extends CartState {}

class DeleteWatchState extends CartState {}

class IncrementWatchState extends CartState {
  num total;
  int count;
  IncrementWatchState({
    required this.total,
    required this.count,
  });
}

class DecrementWatchState extends CartState {
  num total;
  int count;
  DecrementWatchState({
    required this.total,
    required this.count,
  });
}

class ChoosePaymentState extends CartState {
  String option;
  ChoosePaymentState({required this.option});
}
