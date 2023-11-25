import 'package:shopping_app/models/product_model.dart';

List<String> selectCategories = [
  "All Watches",
  "Metallic",
  "Leather",
  "Expencive",
  "Classical"
];

List<String> sortDataby = [
  "Price",
  "Rating",
  "Popularity",
  "Top Selling",
  "Deals and Discounts"
];

List<Map> watches = [
  {
    'name': 'Apple Watch',
    'description':
        'Experience the epitome of smartwatch technology with the Apple Watch, offering a wide range of features and cutting-edge functionality.',
    'price': 2199.99,
    'category': WatchCategory.classic,
    'image': 'assets/images/watch1.png',
    'rating': 1.5,
    'discount': 0.1
  },
  {
    'name': 'Samsung Galaxy Watch',
    'description':
        'levate your style with the Samsung Galaxy Watch, a sleek and stylish timepiece that seamlessly integrates with your daily life, complete with a luxurious leather strap.',
    'price': 1799.99,
    'category': WatchCategory.leather,
    'image': 'assets/images/watch2.png',
    'rating': 5.0,
    'discount': 0.4
  },
  {
    'name': 'Fitbit Versa',
    'description':
        'Achieve your fitness goals with the Fitbit Versa, a dedicated fitness smartwatch that tracks your activities and helps you stay in shape.',
    'price': 999.99,
    'category': WatchCategory.metallic,
    'image': 'assets/images/watch3.png',
    'rating': 3.5,
    'discount': 0.0
  },
  {
    'name': 'Garmin Fenix',
    'description':
        'Embrace the outdoors with confidence, thanks to the Garmin Fenix smartwatch, designed for adventurers and outdoor enthusiasts, complemented by a comfortable leather strap.',
    'price': 2499.99,
    'category': WatchCategory.leather,
    'image': 'assets/images/watch4.png',
    'rating': 4.5,
    'discount': 0.3
  },
];
