part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}

final class ChangeLanguageSuccess extends SettingsState {}

final class ChangeThemeSuccess extends SettingsState {}

class ChangeCurrentPasswordVisibility extends SettingsState {}

class ChangeNewPasswordVisibility extends SettingsState {}

class ChangeConfirmPasswordVisibility extends SettingsState {}

class LogOutSuccess extends SettingsState {}

class DeleteAccountSuccess extends SettingsState {}

class DeleteAccountFailure extends SettingsState {}

class DeleteAccountLoading extends SettingsState {}

class GetPlansSuccess extends SettingsState {}

class GetPlansFailure extends SettingsState {
  final String errMessage;
  GetPlansFailure({required this.errMessage});
}

class GetPlansLoading extends SettingsState {}

class SendContactUsSuccess extends SettingsState {}

class SendContactUsFailure extends SettingsState {
  final String errMessage;
  SendContactUsFailure({required this.errMessage});
}

class SendContactUsLoading extends SettingsState {}

class GetContactUsSuccess extends SettingsState {}

class GetContactUsFailure extends SettingsState {
  final String errMessage;
  GetContactUsFailure({required this.errMessage});
}

class GetContactUsLoading extends SettingsState {}

class GetPromocodesSuccess extends SettingsState {}

class GetPromocodesFailure extends SettingsState {
  final String errMessage;
  GetPromocodesFailure({required this.errMessage});
}

class GetPromocodesLoading extends SettingsState {}

class ChangePasswordSuccess extends SettingsState {}

class ChangePasswordFailure extends SettingsState {
  final String errMessage;
  ChangePasswordFailure({required this.errMessage});
}

class ChangePasswordLoading extends SettingsState {}

class SubscraptionSuccess extends SettingsState {}

class SubscraptionFailure extends SettingsState {
  final String errMessage;
  SubscraptionFailure({required this.errMessage});
}

class SubscraptionLoading extends SettingsState {}

class ConfirmSubscraptionSuccess extends SettingsState {}

class ConfirmSubscraptionFailure extends SettingsState {
  final String errMessage;
  ConfirmSubscraptionFailure({required this.errMessage});
}

class ConfirmSubscraptionLoading extends SettingsState {}

class MySubscraptionSuccess extends SettingsState {}

class MySubscraptionFailure extends SettingsState {
  final String errMessage;
  MySubscraptionFailure({required this.errMessage});
}

class MySubscraptionLoading extends SettingsState {}
