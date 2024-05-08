import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/api/end_ponits.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/shared_preferences_cash_helper.dart';
import 'package:post_bet/features/settings/data/settings_repo/settings_repo.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this.settingsRepository) : super(SettingsInitial());

  final SettingsRepository settingsRepository;
  static SettingsCubit get(context) => BlocProvider.of(context);

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isCurrentPasswordVisible = true;
  bool isNewPasswordVisible = true;
  bool isConfirmPasswordVisible = true;
  void changeCurrentPasswordVisibility() {
    isCurrentPasswordVisible = !isCurrentPasswordVisible;
    emit(ChangeCurrentPasswordVisibility());
  }

  void changeNewPasswordVisibility() {
    isNewPasswordVisible = !isNewPasswordVisible;
    emit(ChangeNewPasswordVisibility());
  }

  void changeConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    emit(ChangeConfirmPasswordVisibility());
  }

  Future<void> initializeLanguage() async {
    // Retrieve the saved language preference when the app starts.
    final bool? savedIsEnglish =
        getIt.get<CashHelperSharedPreferences>().getData(
              key: 'isEnglishh',
            );

    final bool? savedIsDark = getIt.get<CashHelperSharedPreferences>().getData(
          key: 'isDark',
        );

    // Update the isEnglish variable.
    if (savedIsEnglish != null) {
      isEnglish = savedIsEnglish;
    } else if (savedIsDark != null) {
      isEnglish = savedIsDark;
    }
  }

  Future<void> changeLanguage() async {
    // Toggle the language preference.
    isEnglish = !isEnglish;
    emit(ChangeLanguageSuccess());
    // Save the updated language preference.
    getIt
        .get<CashHelperSharedPreferences>()
        .saveData(
          key: 'isEnglishh',
          value: isEnglish,
        )
        .then((value) {
      if (kDebugMode) {
        print(isEnglish);
      }
    });
  }

  Future<void> changeTheme() async {
    // Toggle the language preference.
    isDark = !isDark;
    emit(ChangeThemeSuccess());
    // Save the updated language preference.
    getIt
        .get<CashHelperSharedPreferences>()
        .saveData(
          key: 'isDark',
          value: isDark,
        )
        .then((value) {
      if (kDebugMode) {
        print(isDark);
      }
    });
  }

  void logout() async {
    await getIt
        .get<CashHelperSharedPreferences>()
        .removeData(key: ApiKey.token);
    await getIt.get<CashHelperSharedPreferences>().removeData(key: ApiKey.name);
    await getIt
        .get<CashHelperSharedPreferences>()
        .removeData(key: ApiKey.email);
    await getIt.get<CashHelperSharedPreferences>().removeData(key: ApiKey.id);
    await getIt
        .get<CashHelperSharedPreferences>()
        .removeData(key: ApiKey.profilePic);

    emit(LogOutSuccess());
  }

  deleteAccount() async {
    emit(DeleteAccountLoading());
    final response = await settingsRepository.deleteAccount();
    response.fold(
      (errMessage) => emit(DeleteAccountFailure()),
      (userData) {
        emit(DeleteAccountSuccess());
      },
    );
  }
}
