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
