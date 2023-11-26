abstract class ProfileEvent {}

class EditProfileEvent extends ProfileEvent {
  String name;
  String email;
  String mobile;
  String password;

  EditProfileEvent({
    required this.name,
    required this.email,
    required this.mobile,
    required this.password,
  });
}
