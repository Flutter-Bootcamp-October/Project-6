import 'package:project_bloc/models/customer.dart';
import 'package:project_bloc/models/product.dart';

import 'data_set.dart';

List<Customer> customerList = [];
late Customer currentCustomer;

List<Product> orderProducts = [];
List<Product> listProduct = [];
double globalPrice = 0;
double calculateGlobalPrice() {
  globalPrice = 0;
  for (var element in listProduct) {
    globalPrice += element.count! * double.parse(element.price);
  }
  return globalPrice;
}

void calculateGlobalPric() {
  globalPrice = 0;
  for (var element in orderProducts) {
    globalPrice += element.count! * double.parse(element.price);
  }
}

List<Map<String, dynamic>> searchResults = dataSets;

void searchProduct(String query) {
  searchResults = dataSets
      .where((product) => product["name"]
          .toString()
          .toLowerCase()
          .contains(query.toLowerCase()))
      .toList();
}
