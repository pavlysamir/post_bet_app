part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}

final class ChangeLanguageSuccess extends SettingsState {}

final class ChangeThemeSuccess extends SettingsState {}

class ChangeCurrentPasswordVisibility extends SettingsState {}

class ChangeNewPasswordVisibility extends SettingsState {}

class ChangeConfirmPasswordVisibility extends SettingsState {}
