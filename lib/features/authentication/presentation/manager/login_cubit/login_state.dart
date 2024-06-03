part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginIsPasswordVisibleEye extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String errMessage;
  LoginFailure({required this.errMessage});
}

class MyPlansLoading extends LoginState {}

class MyPlansSuccess extends LoginState {}

class MyPlansFailure extends LoginState {
  final String errMessage;
  MyPlansFailure({required this.errMessage});
}

final class GetUserSuccess extends LoginState {
  final UserDataResponseModel user;

  GetUserSuccess({required this.user});
}

final class GetUserLoading extends LoginState {}

final class GetUserFailure extends LoginState {
  final String errMessage;

  GetUserFailure({required this.errMessage});
}

class ForgetPasswordLoading extends LoginState {}

class ForgetPasswordSuccess extends LoginState {}

class ForgetPasswordFailure extends LoginState {
  final String errMessage;
  ForgetPasswordFailure({required this.errMessage});
}

class VerifyForgetPasswordLoading extends LoginState {}

class VerifyForgetPasswordSuccess extends LoginState {}

class VerifyForgetPasswordFailure extends LoginState {
  final String errMessage;
  VerifyForgetPasswordFailure({required this.errMessage});
}

class NewForgetPasswordLoading extends LoginState {}

class NewForgetPasswordSuccess extends LoginState {}

class NewForgetPasswordFailure extends LoginState {
  final String errMessage;
  NewForgetPasswordFailure({required this.errMessage});
}
