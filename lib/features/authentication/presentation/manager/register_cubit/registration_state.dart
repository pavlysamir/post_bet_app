part of 'registration_cubit.dart';

@immutable
sealed class RegistrationState {}

final class RegistrationInitial extends RegistrationState {}

class RegisterIsPasswordVisibleEye extends RegistrationState {}

class RegisterIsConfirmPasswordVisibleEye extends RegistrationState {}
