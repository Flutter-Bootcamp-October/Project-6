import 'package:store_watch/data/data_set.dart';
import 'package:store_watch/models/customer.dart';
import 'package:store_watch/models/product.dart';

List<Customer> customerList = [];
late Customer currentCustomer;

List<Product> orderProducts = [];
List<Product> listProduct = [];
double globalPrice = 0;

dynamic calculateGlobalPrice() {
  globalPrice = 0;
  for (var element in listProduct) {
    globalPrice += (element.count! * double.parse(element.price));
  }
  return globalPrice;
}

void calculateGlobalPric() {
  globalPrice = 0;
  for (var element in orderProducts) {
    globalPrice += element.count! * double.parse(element.price);
  }
}

void getProductObjects() {
  for (var element in dataSets) {
    listProduct.add(Product.fromJson(element));
  }
}
