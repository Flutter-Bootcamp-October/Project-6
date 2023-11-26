import 'package:wach_store_app/dataset/wach_dataset.dart';
import 'package:wach_store_app/models/user.dart';
import 'package:wach_store_app/models/wach_model.dart';

List<WatchProduct> WachProductList = [];
List<WatchProduct> orderProducts = [];
List<WatchProduct> filteredWachList = [];
List<String> options = ['mastercard', 'paypal'];
String copun = '';

enum SelectedTab { home, favorite, search, person }

User? userObject;
List<User> userList = [];
double globalPrice = 0;
void calculateGlobalPrice() {
  globalPrice = 0;
  for (var element in orderProducts) {
    globalPrice += element.count! * double.parse(element.price!);
  }
}

loadProducts() {
  for (var element in WachDataSet) {
    WachProductList.add(WatchProduct.fromJson(element));
  }
}
