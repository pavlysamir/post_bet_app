import 'package:go_router/go_router.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/shared_preferences_cash_helper.dart';
import 'package:post_bet/features/authentication/presentation/views/forget_password_screen.dart';
import 'package:post_bet/features/authentication/presentation/views/login_screen.dart';
import 'package:post_bet/features/authentication/presentation/views/regester_screen.dart';
import 'package:post_bet/features/authentication/presentation/views/verify_mail_screen.dart';
import 'package:post_bet/features/home/presentation/views/home_screen.dart';
import 'package:post_bet/features/on_boarding/presentations/on_boarding_view.dart';
import 'package:post_bet/features/authentication/presentation/views/welcom_view.dart';

abstract class AppRouter {
  static const kWelcomeView = '/';
  static const kOnBoarding = '/OnBoardingScreen';
  static const kRegistretion = '/RegistretionScreen';
  static const kLogin = '/LoginScreen';
  static const kForgotPassword = '/ForgotPasswordScreen';
  static const kVerifyEmail = '/VerifyEmailScreen';
  static const kHomeScreen = '/HomeScreen';

  static final router = GoRouter(
      initialLocation: kOnBoarding,
      // getIt.get<CashHelperSharedPreferences>().getData(key: 'onBoarding') ==
      //         true
      //     ? kLoginView
      //     : kOnBoarding,
      routes: [
        GoRoute(
          path: kWelcomeView,
          builder: (context, state) => const WelcomScreen(),
        ),
        GoRoute(
          path: kOnBoarding,
          builder: (context, state) => OnBoardingScreen(),
        ),
        GoRoute(
          path: kRegistretion,
          builder: (context, state) => RegisterScreen(),
        ),
        GoRoute(
          path: kLogin,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: kForgotPassword,
          builder: (context, state) => const ForgetPasswordScreen(),
        ),
        GoRoute(
          path: kVerifyEmail,
          builder: (context, state) => const VerifyEmailScreen(),
        ),
        GoRoute(
          path: kHomeScreen,
          builder: (context, state) => const HomeScreen(),
        ),
      ]);
}
