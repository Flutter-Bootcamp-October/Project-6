import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_watch/blocs/profile_bloc/profile_event.dart';
import 'package:store_watch/blocs/profile_bloc/profile_state.dart';
import 'package:store_watch/data/global.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileUpdateInitial()) {
    on<ProfileEvent>((event, emit) {
      if (event.name.isNotEmpty &&
          event.mobileNumber.isNotEmpty &&
          event.email.isNotEmpty &&
          event.password.isNotEmpty) {
        currentCustomer.name = event.name;
        currentCustomer.mobileNumber = int.parse(event.mobileNumber);
        currentCustomer.email = event.email;
        currentCustomer.password = event.password;

        emit(SuccessState(
            successMessage: "Your profile was successfully updated"));
      } else {
        emit(ErrorState(errorMessage: "Please complete all fields"));
      }
    });
  }
}
