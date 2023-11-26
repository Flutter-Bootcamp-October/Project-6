import 'package:shopping_app/data/data.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/models/user_model.dart';

List<User> usersList = [];
User currentUser = User(
  email: 'a',
  fullName: 'a',
  imagePath: 'lib/assets/images/profile.png',
  mobileNumber: 'a',
  password: 'a',
);
List<Product> searchResults = [];

List<Product> productList = [];
getProductObjects() {
  for (var element in watchesdata) {
    productList.add(Product.fromJson(element));
  }
}

double getTotal() {
  double total = 0;
  for (var Product in productList) {
    total += (Product.price * Product.count);
  }
  return total;
}

double getItemTotal(Product product) {
  return product.price * product.count;
}
