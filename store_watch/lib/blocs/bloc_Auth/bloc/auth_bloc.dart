import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_watch/data/global.dart';
import 'package:store_watch/models/customer.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignUpEvent>((event, emit) {
      late String email;
      late String userName;
      bool isFound = false;
      if (event.emailOrUsername.isNotEmpty &&
          event.userName.isNotEmpty &&
          event.pass.isNotEmpty) {
        if (event.userName.length > 2) {
          if (event.emailOrUsername.contains('@') &&
              event.emailOrUsername.endsWith('.com')) {
            email = event.emailOrUsername;
            userName = "null";
          } else {
            email = "null";
            userName = event.emailOrUsername;
          }
          for (var customer in customerList) {
            if (customer.email == email || customer.userName == userName) {
              isFound = true;

              emit(ErrorState(message: 'This email or userName already used'));
              // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              //   content: Text("This email or userName already used "),
              //   backgroundColor: Color(0xffFF7779),
              // ));
            }
          }
          if (!isFound) {
            Customer newCustomer = Customer(
              userName: userName,
              email: email,
              name: event.userName,
              password: event.pass,
            );

            customerList.add(newCustomer);

            emit(SignUpSuccessedState());
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => const SignInUp(),
            //     ));
          }
        } else {
          emit(ErrorState(message: 'Please enter correct name'));
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(
          //     content: Text(
          //       "Please enter correct name",
          //     ),
          //     // backgroundColor: Color(0xffff8989),
          //     // padding: EdgeInsets.only(top: 32, left: 16),
          //   ),
          // );
        }
      } else {
        emit(ErrorState(message: 'Please complete all fields'));
        // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        //   content: Text("Please complete all fields"),
        //   padding: EdgeInsets.only(top: 32, left: 16),
        //   backgroundColor: Color(0xffff8989),
        // ));
      }
    });
    on<SignInEvent>((event, emit) {
      for (var customer in customerList) {
        if (customer.userName == event.emailOrUsername ||
            customer.email == event.emailOrUsername &&
                customer.password == event.pass) {
          currentCustomer = customer;
          emit(SignInSuccessedState());
        }
        return;
      }
      emit(ErrorState(message: 'Please enter correct username or email'));
    });
  }
}
