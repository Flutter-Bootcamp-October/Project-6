import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_watch/blocs/auth_bloc/auth_event.dart';
import 'package:store_watch/blocs/auth_bloc/auth_state.dart';
import 'package:store_watch/data/global.dart';
import 'package:store_watch/models/customer.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignUpEvent>((event, emit) {
      bool isFound = false;
      late String email;
      late String userName;
      if (event.userNameOrEmail.isNotEmpty &&
          event.name.isNotEmpty &&
          event.password.isNotEmpty) {
        if (event.name.length > 2) {
          if (event.userNameOrEmail.contains('@') &&
              event.userNameOrEmail.endsWith('.com')) {
            email = event.userNameOrEmail;
            userName = "null";
          } else {
            email = "null";
            userName = event.userNameOrEmail;
          }

          for (var customer in customerList) {
            if (customer.email == email || customer.userName == userName) {
              isFound = true;
              emit(ErrorState(
                  errorMessage: "This email or userName already used "));
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

            emit(SignUpSuccessedState());
          }
        } else {
          emit(ErrorState(errorMessage: "Please enter correct name"));
        }
      } else {
        emit(ErrorState(errorMessage: "Please complete all fields"));
      }
    });

    on<SignInEvent>((event, emit) {
      for (var customer in customerList) {
      //  print(customer.userName);
        if (customer.userName == event.userNameOrEmail ||
            customer.email == event.userNameOrEmail &&
                customer.password == event.password) {
          currentCustomer = customer;

          emit(SignInSuccessedState());
        }
        return;
      }
      emit(ErrorState(errorMessage: "Please enter correct username or email"));
    });
  }
}
