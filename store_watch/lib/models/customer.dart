class Customer {
  String? userName;
  String? email;
  String? name;
  String? password;
  int? mobileNumber;

  Customer(
      {required this.userName,
      required this.email,
      required this.name,
      required this.password,
      this.mobileNumber = 0});

  factory Customer.fromJson(Map json) {
    return Customer(
        userName: json["userName"],
        email: json["email"],
        name: json["name"],
        password: json["password"],
        mobileNumber: json["mobileNumber"]);
  }
}
//