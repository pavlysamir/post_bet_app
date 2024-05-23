part of 'registration_cubit.dart';

@immutable
sealed class RegistrationState {}

final class RegistrationInitial extends RegistrationState {}

class RegisterIsPasswordVisibleEye extends RegistrationState {}

class RegisterIsConfirmPasswordVisibleEye extends RegistrationState {}

class SignUpLoading extends RegistrationState {}

class SignUpSuccess extends RegistrationState {
  final String data;
  SignUpSuccess({required this.data});
}

class SignUpFailure extends RegistrationState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}

class VerfyOtpLoading extends RegistrationState {}

class VerfyOtpSuccess extends RegistrationState {}

class VerfyOtpFailure extends RegistrationState {
  final String errMessage;

  VerfyOtpFailure({required this.errMessage});
}

final class GetUserSuccess extends RegistrationState {
  final UserDataResponseModel user;

  GetUserSuccess({required this.user});
}

final class GetUserLoading extends RegistrationState {}

final class GetUserFailure extends RegistrationState {
  final String errMessage;

  GetUserFailure({required this.errMessage});
}
