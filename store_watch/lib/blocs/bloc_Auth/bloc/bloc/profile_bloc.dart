import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_watch/data/global.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitialState()) {
    on<UpdateEvent>((event, emit) {
      if (event.name.isNotEmpty &&
          event.number.isNotEmpty &&
          event.email.isNotEmpty &&
          event.pass.isNotEmpty) {
        currentCustomer.name = event.name;
        currentCustomer.mobileNumber = int.parse(event.number);
        currentCustomer.email = event.email;
        currentCustomer.password = event.pass;

        emit(UpdateState(
            messageSuccssed: 'Your profile was successfully updated'));
      } else {
        emit(ErrorState(message: 'Please complete all fields'));
      }
    });
  }
}
