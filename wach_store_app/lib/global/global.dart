import 'package:wach_store_app/models/user.dart';
import 'package:wach_store_app/models/wach_model.dart';

List<WatchProduct> WachProductList = [];
List<WatchProduct> cartProducts = [];

double globalPrice = 0;
double discount = 0.75;
// double discountAmount = globalPrice * 0.25;
// double grandTotal = globalPrice * discount;

double discountAmount = 0;
double grandTotal = 0;
void calculateGlobalPrice() {
  globalPrice = 0;
  for (var element in cartProducts) {
    globalPrice += element.count! * double.parse(element.price!);
  }
}

List<String> categories = [
  'Trending',
  'Popular',
  'New',
  'Best Collection',
];

List addresses = [
  {
    'userId': 1,
    'address': '',
  },
];

User? userObject;
List<User> userList = [];
