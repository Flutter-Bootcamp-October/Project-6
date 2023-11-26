class Watch {
  final String name, description, image;
  final double price;

  Watch({required this.name, required this.price, required this.description, required this.image});

  factory Watch.fromJson(Map json) {
    return Watch(
      description: json["description"],
      price: json["price"],
      name: json["name"],
      image: json["image"],
    );
  }
}
