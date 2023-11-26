import 'package:shopping_watch_application_bloc/Data/user_datasets.dart';
import 'package:shopping_watch_application_bloc/Data/watch_datasets.dart';
import 'package:shopping_watch_application_bloc/Model/User_model.dart';
import 'package:shopping_watch_application_bloc/Model/watch_product_model.dart';

// Define and initialize the global lists
List<User> userList = [
  User(emailAddress: "a", password: "1"),
];
List<Watch> listWatch = [];
List<Watch> listOrderWatch = [];

late User currentUser;
late Watch currentWatch;
double globalPrice = 0;

//  calculateGlobalPrice() {
//   double globalPrice = 0;
//   for (var element in listOrderWatch) {
//     globalPrice = globalPrice + (element.count! * element.price);
//   }
//   print(globalPrice);
//   return globalPrice.toStringAsFixed(2);
// }

calculateGlobalPrice() {
  double total = 0;
  for (var obj in listOrderWatch) {
    total = total + (obj.price! * obj.count!);
  }
  return total;
}

void populateUserList() {
  for (var userData in userDataSets) {
    User user = User.fromJson(userData);
    userList.add(user);
    // Add the created user to the global list
  }
}

void populateWatchList() {
  for (var watchData in watchDataSets) {
    Watch watch = Watch.fromJson(watchData);
    listWatch.add(watch);
    // Add the created watch to the global list
  }
}
