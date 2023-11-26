class User {
  int? userId;
  String? email;
  String? name;
  String? password;

  String? mobile;
  List<String>? address;
  int idGeneratore = 0;
  User(
      {required this.name,
      required this.email,
      required this.password,
      this.mobile,
      this.address}) {
    idGeneratore++;
    userId = idGeneratore;
  }

  factory User.fromJson(Map json) {
    return User(
      name: json["name"],
      email: json["email"],
      mobile: json['mobile'],
      address: json['address'],
      password: json["password"],
    );
  }
}


// class User {
//   int? userId;
//   String? name;
//   String? email;
//   String? password;
//   static int count = 0;

//   User({required this.name, required this.email, required this.password}) {
//     count++;
//     userId = count;
//   }

//   factory User.fromJson(Map json) {
//     return User(
//         name: json["name"], email: json["email"], password: json["password"]);
//   }

//   Map toJson() {
//     return {
//       "userId": userId,
//       "name": name,
//       "email": email,
//       "password": password
//     };
//   }
// }