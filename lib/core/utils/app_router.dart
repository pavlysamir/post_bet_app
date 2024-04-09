import 'package:go_router/go_router.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/shared_preferences_cash_helper.dart';
import 'package:post_bet/features/authentication/presentation/regester_screen.dart';
import 'package:post_bet/features/on_boarding/presentations/on_boarding_view.dart';
import 'package:post_bet/features/authentication/presentation/login_view.dart';

abstract class AppRouter {
  static const kLoginView = '/';
  static const kOnBoarding = '/OnBoardingScreen';
  static const kRegistretion = '/RegistretionScreen';

  static final router = GoRouter(
      initialLocation: kOnBoarding,
      // getIt.get<CashHelperSharedPreferences>().getData(key: 'onBoarding') ==
      //         true
      //     ? kLoginView
      //     : kOnBoarding,
      routes: [
        GoRoute(
          path: kLoginView,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: kOnBoarding,
          builder: (context, state) => OnBoardingScreen(),
        ),
        GoRoute(
          path: kRegistretion,
          builder: (context, state) => RegisterScreen(),
        ),
      ]);
}
