import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:post_bet/core/api/dio_consumer.dart';
import 'package:post_bet/features/authentication/data/repo/auth_repo.dart';

import 'shared_preferences_cash_helper.dart';

final getIt = GetIt.instance;
void setUpServiceLocator() {
  getIt.registerSingleton<CashHelperSharedPreferences>(
      CashHelperSharedPreferences());
  getIt.registerSingleton<DioConsumer>(DioConsumer(dio: Dio()));
  getIt.registerSingleton<AuthRepository>(AuthRepository(
    api: getIt.get<DioConsumer>(),
  ));
}
