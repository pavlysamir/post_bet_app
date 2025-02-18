import 'package:go_router/go_router.dart';
import 'package:post_bet/core/Layouts/home_layout.dart';
import 'package:post_bet/features/authentication/presentation/views/forget_password_screen.dart';
import 'package:post_bet/features/authentication/presentation/views/login_screen.dart';
import 'package:post_bet/features/authentication/presentation/views/regester_screen.dart';
import 'package:post_bet/features/authentication/presentation/views/verify_mail_screen.dart';
import 'package:post_bet/features/home/presentation/views/home_screen.dart';
import 'package:post_bet/features/on_boarding/presentations/on_boarding_view.dart';
import 'package:post_bet/features/authentication/presentation/views/welcom_view.dart';
import 'package:post_bet/features/profile/presentation/view/edit%20profile%20screen.dart';

abstract class AppRouter {
  static const kWelcomeView = '/';
  static const kOnBoarding = '/OnBoardingScreen';
  static const kRegistretion = '/RegistretionScreen';
  static const kLogin = '/LoginScreen';
  static const kForgotPassword = '/ForgotPasswordScreen';
  static const kVerifyEmail = '/VerifyEmailScreen';
  static const kHomeScreen = '/HomeScreen';
  static const kHomeLayOut = '/HomeLayOut';
  static const kEditProfile = '/EditProfile';

  static final router = GoRouter(
      initialLocation: kEditProfile,
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
          builder: (context, state) => const RegisterScreen(),
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
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: kHomeLayOut,
          builder: (context, state) => const HomeLayout(),
        ),
        GoRoute(
          path: kEditProfile,
          builder: (context, state) => const EditProfileScreen(),
        ),
      ]);
}
