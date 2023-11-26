class User {
  String? img;
  String? fullName;
  String? username;
  String? mobileNumber;
  String? emailAddress;
  String? password;

  User({
    this.img,
    this.fullName,
    this.username,
    this.mobileNumber,
    this.emailAddress,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      img: json['img'],
      fullName: json['full_name'],
      username: json['username'],
      mobileNumber: json['mobile_number'],
      emailAddress: json['email_address'],
      password: json['password'],
    );
  }
}
