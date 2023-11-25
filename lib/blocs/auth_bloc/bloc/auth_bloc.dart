import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc/data/data_set.dart';
import 'package:project_bloc/data/global.dart';
import 'package:project_bloc/models/customer.dart';
import 'package:project_bloc/models/product.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    bool isFound = false;
    late String email;
    late String userName;
    on<SignUpEvent>((event, emit) {
      if (event.email.isNotEmpty &&
          event.name.isNotEmpty &&
          event.password.isNotEmpty) {
        if (event.name.length > 2) {
          if (event.email.contains('@') && event.email.endsWith('.com')) {
            email = event.email;
            userName = "null";
          } else {
            email = "null";
            userName = event.email;
          }

          for (var customer in customerList) {
            if (customer.email == event.email ||
                customer.userName == event.name) {
              isFound = true;
              emit(ErrorState(msg: "This email or userName already used "));
            }
          }
          if (!isFound) {
            Customer newCustomer = Customer(
              userName: userName,
              email: email,
              name: event.name,
              password: event.password,
            );

            customerList.add(newCustomer);
            emit(AuthInitial());
          }
        } else {
          emit(ErrorState(msg: "Please enter correct name"));
        }
      } else {
        emit(ErrorState(msg: "Please complete all fields"));
      }
    });
    on<LogInEvent>((event, emit) {
      if (event.email.isNotEmpty && event.password.isNotEmpty) {
        for (var customer in customerList) {
          if ((customer.userName == event.email ||
                  customer.email == event.email) &&
              customer.password == event.password) {
            currentCustomer = customer;
            for (var element in dataSets) {
              listProduct.add(Product.fromJson(element));
            }
            emit(AuthInitial());
          }
        }
        for (var element in customerList) {
          if (element.userName != event.email ||
              element.password != event.password) {
            emit(ErrorState(msg: "password or email it's not true"));
          }
        }
      } else {
        emit(ErrorState(msg: "Please enter the username And email"));
      }
    });
  }
}
