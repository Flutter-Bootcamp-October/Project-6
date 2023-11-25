import 'package:flutter/material.dart';
import 'package:project_4/data/user_data_set.dart';
import 'package:project_4/data/watch_data_set.dart';

import '../models/user_model.dart';
import '../models/watch_model.dart';

late User currentUser;

List<User> usersList = [];

List doesExists = [];

List<User> loggedInUsers = [];

List<Watch> watchesList = [];

List<Watch> cartList = [];

List boughtItemsName = [];

ValueNotifier<double> grandTotal = ValueNotifier(0.0);
ValueNotifier<double> itemsTotal = ValueNotifier(0.0);

double discount = 0;

void getUsers() {
  if (usersList.isEmpty) {
    for (var users in usersDataSet) {
      usersList.add(User(
          address: users["address"],
          userAvatar: users["userAvatar"],
          email: users["email"],
          password: users["password"],
          mobileNumber: users["mobileNumber"],
          name: users["name"]));
    }
  }
}

void getWatches() {
  if (watchesList.isEmpty) {
    for (var element in watches) {
      watchesList.add(Watch.fromJson(element));
    }
  }
}
