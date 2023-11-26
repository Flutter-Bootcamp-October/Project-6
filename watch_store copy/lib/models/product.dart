class Product {
  final String image;
  final String name;
  final String description;
  final String price;
  num subTotal;
  int? count;

  Product(
      {required this.name,
      required this.description,
      required this.price,
      required this.image,
      this.count,
      required this.subTotal});

  factory Product.fromJson(Map json) {
    return Product(
        name: json["name"],
        description: json["description"],
        price: json["price"],
        image: json["image"],
        count: json['count'],
        subTotal: json["sub_total"]);
  }
}
