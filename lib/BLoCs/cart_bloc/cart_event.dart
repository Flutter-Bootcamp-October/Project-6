import 'package:wach_store_app/models/wach_model.dart';

abstract class CartEvent {}

class AddWatchFromHomeEvent extends CartEvent {
  WatchProduct watch;
  AddWatchFromHomeEvent({required this.watch});
}

class AddWatchFromDetailsEvent extends CartEvent {
  WatchProduct watch;
  AddWatchFromDetailsEvent({required this.watch});
}

class DeleteWatchEvent extends CartEvent {
  WatchProduct watch;
  DeleteWatchEvent({required this.watch});
}

class IncrementWatchEvent extends CartEvent {
  WatchProduct watch;
  IncrementWatchEvent({required this.watch});
}

class DecrementWatchEvent extends CartEvent {
  WatchProduct watch;
  DecrementWatchEvent({required this.watch});
}

class AddToCartEvent extends CartEvent {
  WatchProduct watch;
  AddToCartEvent({required this.watch});
}

class ChoosePaymentEvent extends CartEvent {
  String option;
  ChoosePaymentEvent({required this.option});
}

// class CopunEvent extends CartEvent {
//   String copun;
//   CopunEvent({required this.copun});
// }
