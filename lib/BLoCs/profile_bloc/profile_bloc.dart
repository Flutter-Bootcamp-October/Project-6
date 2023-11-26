import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wach_store_app/BLoCs/profile_bloc/profile_event.dart';
import 'package:wach_store_app/BLoCs/profile_bloc/profile_state.dart';
import 'package:wach_store_app/global/global.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<EditProfileEvent>((event, emit) {
      if (event.name.isNotEmpty &&
          event.email.isNotEmpty &&
          event.password.isNotEmpty) {
        userObject!.mobile = event.mobile;
        userObject!.name = event.name;
        userObject!.email = event.email;
        userObject!.password = event.password;
        emit(EditSuccessState());
        log('If ${userObject!.name}');
      } else {
        log('Else ${event.name}');
        emit(EditErrorState());
      }
    });
  }
}
