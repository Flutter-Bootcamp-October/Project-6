import 'package:watch_store/models/product.dart';

class User {
  int? userId;
  String? name;
  String? email;
  String? password;
  String? phone;
  static int count = 0;
  List<Product> productList = [];
  num? total = 0;
  num? grandTotal = 0;
  List<String> location = [];
  // final String? text;

  User(
      {required this.name,
      required this.email,
      required this.password,
      required this.phone}) {
    count++;
    userId = count;
  }

  // factory User.fromJson(Map json) {
  //   return User(
  //       name: json["name"], email: json["email"], password: json["password"]);
  // }

  // Map toJson() {
  //   return {
  //     "userId": userId,
  //     "name": name,
  //     "email": email,
  //     "password": password
  //   };
  // }
}
