class Product {
  final String name;
  final String description;
  final String image;
  final double rating;
  final double price;
  final double discount;
  int count = 0;
  WatchCategory category;

  Product(
      {required this.name,
      required this.description,
      required this.price,
      required this.category,
      required this.image,
      required this.rating,
      required this.discount});

  factory Product.fromJson(Map json) {
    return Product(
        name: json['name'],
        description: json['description'],
        price: json['price'],
        category: json['category'],
        image: json['image'],
        rating: json['rating'],
        discount: json['discount']);
  }
}

enum WatchCategory { metallic, classic, leather }
