part of 'registration_cubit.dart';

@immutable
sealed class RegistrationState {}

final class RegistrationInitial extends RegistrationState {}

class RegisterIsPasswordVisibleEye extends RegistrationState {}

class RegisterIsConfirmPasswordVisibleEye extends RegistrationState {}

class SignUpLoading extends RegistrationState {}

class SignUpSuccess extends RegistrationState {}

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
