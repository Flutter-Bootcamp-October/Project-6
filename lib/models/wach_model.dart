class WatchProduct {
  final String image;
  final String name;

  final String? price;
  final String description;
  int? count;
  WatchProduct(
      {required this.image,
      required this.name,
      required this.price,
      this.count,
      required this.description});

  factory WatchProduct.fromJson(Map json) {
    return WatchProduct(
      description: json['description'],
      image: json['image'],
      name: json['name'],
      count: json['count'],
      price: json['price'],
    );
  }
}
