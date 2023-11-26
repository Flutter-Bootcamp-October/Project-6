import 'package:watch_store/data/data_products.dart';
import 'package:watch_store/models/product.dart';
import 'package:watch_store/models/user.dart';

List<User> usersList = [User(name: "j", email: "j", password: "j", phone: "j")];
List<Product> listProducts = [];
List<String> location = [];

late User currentUser;

void calculateTotalPrice() {
  currentUser.total = 0;
  for (var product in currentUser.productList) {
    currentUser.total =
        currentUser.total! + (product.count! * double.parse(product.price));
  }
}

getProductObjects() {
  for (var element in dataProducts) {
    listProducts.add(Product.fromJson(element));
  }
}
