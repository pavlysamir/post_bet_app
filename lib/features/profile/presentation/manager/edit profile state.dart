import 'package:post_bet/features/profile/data/models/profile_model.dart';

abstract class EditProfileState {}

class InitialEditProfileState extends EditProfileState {}

class ChangeCurrentPasswordVisibility extends EditProfileState {}

class ChangeNewPasswordVisibility extends EditProfileState {}

class ChangeConfirmPasswordVisibility extends EditProfileState {}

class SuccessfulPickImage extends EditProfileState {}

class FailPickImage extends EditProfileState {}

class UpdateUserDataLoading extends EditProfileState {}

class UpdateUserDataSuccess extends EditProfileState {
  final ProfileResponseModle user;

  UpdateUserDataSuccess({required this.user});
}

class UpdateUserDataFailure extends EditProfileState {
  final String errMessage;

  UpdateUserDataFailure({required this.errMessage});
}
