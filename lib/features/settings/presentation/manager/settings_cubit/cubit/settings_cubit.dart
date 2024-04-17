import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/shared_preferences_cash_helper.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());
  static SettingsCubit get(context) => BlocProvider.of(context);

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
    }

    if (savedIsDark != null) {
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
      print(isEnglish);
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
      print(isDark);
    });
  }
}
