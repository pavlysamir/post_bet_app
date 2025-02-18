import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_bet/core/utils/shared_preferences_cash_helper.dart';
import 'package:post_bet/features/activities/presentation/views/activities_screen.dart';
import 'package:post_bet/features/home/presentation/views/home_screen.dart';
import 'package:post_bet/features/platform/presentation/views/platform_screen.dart';
import 'package:post_bet/features/settings/presentation/views/settings_screen.dart';
part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutInitial());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);
  bool isDark = true;
  Future<void> changeAppThemeMode({bool? sharedMode}) async {
    if (sharedMode != null) {
      isDark = sharedMode;
      emit(themeChangeMode(isDark: isDark));
    } else {
      isDark = !isDark;
      await CashHelperSharedPreferences()
          .saveData(key: 'mode', value: isDark)
          .then((value) {
        emit(themeChangeMode(isDark: isDark));
      });
    }
  }

  int currentIndex = 0;
  List screens = [
    HomeScreen(),
    const ActivitiesScreen(),
    const PlatformScreen(),
    const SettingsScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;

    emit(HomeChaneNavBar());
  }
}
