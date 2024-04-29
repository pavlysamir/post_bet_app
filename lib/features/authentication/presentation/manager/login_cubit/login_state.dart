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

final class GetUserSuccess extends LoginState {
  final UserDataResponseModel user;

  GetUserSuccess({required this.user});
}

final class GetUserLoading extends LoginState {}

final class GetUserFailure extends LoginState {
  final String errMessage;

  GetUserFailure({required this.errMessage});
}
