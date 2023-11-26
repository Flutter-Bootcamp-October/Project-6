class Address {
  String type; //home, work, etc
  String phone;
  String address;
  final String userId; //email? username?

  Address(this.type, this.address, this.phone, {required this.userId});
}
