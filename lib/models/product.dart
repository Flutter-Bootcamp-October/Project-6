class Product {
  final String image;
  final String name;
  final String description;
  String price;
  dynamic count;
  final int popularity;

  Product({
    this.count,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.popularity,
  });
  factory Product.fromJson(Map json) {
    return Product(
        image: json['image'],
        name: json['name'],
        description: json['description'],
        price: json['price'],
        count: json['count'],
        popularity: json['popularity']);
  }
}
