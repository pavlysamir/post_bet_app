import 'package:dio/dio.dart';
import 'package:post_bet/core/api/end_ponits.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/shared_preferences_cash_helper.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.token] = getIt
                .get<CashHelperSharedPreferences>()
                .getData(key: ApiKey.token) !=
            null
        ? '${getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.token)}'
        : null;
    super.onRequest(options, handler);
  }
}
