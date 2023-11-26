import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/data/global_data.dart';
import 'package:project_4/models/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginEvent>((event, emit) {
      if (event.email.isNotEmpty && event.password.isNotEmpty) {
        for (var item in usersList) {
          if (event.email.trim().toLowerCase() == item.email!.toLowerCase() &&
              event.password.trim().toLowerCase() == item.password!.toLowerCase()) {
            doesExists.add(true);
            currentUser = item;
            loggedInUsers.add(item);
            emit(AuthSuccessState());
          }
        }
        if (!doesExists.contains(true)) {
          emit(AuthLoginErrorState(errorMsg: 'This Account does not exist'));
        }
      } else {
        emit(AuthLoginErrorState(errorMsg: 'Please Fill The Required Fields'));
      }
    });

    on<AuthRegisterEvent>((event, emit) {
      if (event.email.isNotEmpty && event.password.isNotEmpty && event.userName.isNotEmpty) {
        List doesExists = [];
        for (var item in usersList) {
          if (item.email!.contains(event.email.trim().toLowerCase())) {
            doesExists.add(true);
          }
        }
        if (!doesExists.contains(true)) {
          currentUser = User(
            address: [],
            userAvatar: "",
            email: event.email.trim(),
            password: event.password.trim(),
            mobileNumber: '',
            name: event.userName.trim(),
          );
          loggedInUsers.add(currentUser);
          usersList.add(currentUser);
          emit(AuthSuccessState());
        } else {
          emit(AuthRegisterErrorState(errorMsg: 'Account Exists'));
        }
      } else {
        emit(AuthRegisterErrorState(errorMsg: 'Please Fill The Required Fields'));
      }
    });
  }
}

// void checkUserSignUpInfo(
//     BuildContext context, emailController, passwordController, nameController) {
//   List doesExists = [];
//   // if (emailController.text.isEmpty) {
//   //   ScaffoldMessenger.of(context)
//   //       .showSnackBar(const SnackBar(content: Text("Please write your email")));
//   // } else if (passwordController.text.isEmpty) {
//   //   ScaffoldMessenger.of(context)
//   //       .showSnackBar(const SnackBar(content: Text("Please write your password")));
//   // }
//   // else {
//     usersList.map((e) {
//       if (e.email!.contains(emailController.text.trim().toLowerCase())) {
//         doesExists.add(true);
//         ScaffoldMessenger.of(context)
//             .showSnackBar(const SnackBar(content: Text("This Email already have an account")));
//       }
//     }).toList();
//     if (!doesExists.contains(true)) {
//       currentUser = User(
//           address: [],
//           userAvatar: "",
//           email: emailController.text.trim(),
//           password: passwordController.text.trim(),
//           mobileNumber: '',
//           name: nameController.text.trim());
//       loggedInUsers.add(currentUser);
//       usersList.add(currentUser);
//       Navigator.pushAndRemoveUntil(context,
//           MaterialPageRoute(builder: (context) => const BottomNavBar()), (route) => false);
//     }
//   // }
//
//   Navigator.pushAndRemoveUntil(context,
//       MaterialPageRoute(builder: (context) => const BottomNavBar()), (route) => false);

// }
