import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:post_bet/core/api/dio_consumer.dart';
import 'package:post_bet/features/activities/data/repo/activities_repo.dart';
import 'package:post_bet/features/authentication/data/repo/auth_repo.dart';
import 'package:post_bet/features/home/data/post_repo.dart';
import 'package:post_bet/features/platform/data/repo/platforms_repo.dart';
import 'package:post_bet/features/profile/data/profile_repo/profile_repo.dart';
import 'package:post_bet/features/settings/data/settings_repo/settings_repo.dart';

import 'shared_preferences_cash_helper.dart';

final getIt = GetIt.instance;
void setUpServiceLocator() {
  getIt.registerSingleton<CashHelperSharedPreferences>(
      CashHelperSharedPreferences());
  getIt.registerSingleton<DioConsumer>(DioConsumer(dio: Dio()));
  getIt.registerSingleton<AuthRepository>(AuthRepository(
    api: getIt.get<DioConsumer>(),
  ));

  getIt.registerSingleton<ProfileRepository>(ProfileRepository(
    api: getIt.get<DioConsumer>(),
  ));

  getIt.registerSingleton<SettingsRepository>(SettingsRepository(
    api: getIt.get<DioConsumer>(),
  ));

  getIt.registerSingleton<PlatFormsRepositery>(PlatFormsRepositery());

  getIt.registerSingleton<PostReposatory>(PostReposatory(
    getIt.get<DioConsumer>(),
  ));
  getIt.registerSingleton<ActivitiesRepo>(ActivitiesRepo());
}
