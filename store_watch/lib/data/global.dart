import 'package:store_watch/models/customer.dart';
import 'package:store_watch/models/product.dart';

List<Customer> customerList = [];
late Customer currentCustomer;

List<Product> orderProducts = [];
List<Product> listProduct = [];
double globalPrice = 0;

@override
void calculateGlobalPrice(Product product) {
  globalPrice = 0;
  // for (var element in listProduct) {
  if (product.count == 0) {
    product.count += 1;
  }
  globalPrice += product.count! * double.parse(product.price);
  // }
}

void calculateGlobalPric() {
  globalPrice = 0;
  for (var element in orderProducts) {
    globalPrice += element.count! * double.parse(element.price);
  }
}
