import 'package:shopping_app/models/product_model.dart';

class User {
  String fullName;
  String email;
  String password;
  String imagePath;
  String mobileNumber;
  List<Product> cart = [];

  User(
      {required this.email,
      required this.fullName,
      required this.imagePath,
      required this.mobileNumber,
      required this.password});

  void usertoSring() {
    print("-----------------");
    print("|name: $fullName|");
    print("|email: $email|");
    print("|mobileNumber: $mobileNumber|");
    print("|password: $password|");
    print("-----------------");
  }
}
