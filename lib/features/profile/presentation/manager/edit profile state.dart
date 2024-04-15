abstract class EditProfileState {}

class InitialEditProfileState extends EditProfileState {}

class ChangeCurrentPasswordVisibility extends EditProfileState {}

class ChangeNewPasswordVisibility extends EditProfileState {}

class ChangeConfirmPasswordVisibility extends EditProfileState {}

class SuccessfulPickImage extends EditProfileState {}

class FailPickImage extends EditProfileState {}
