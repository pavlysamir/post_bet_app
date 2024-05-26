import 'package:go_router/go_router.dart';
import 'package:post_bet/core/Layouts/home_layout.dart';
import 'package:post_bet/core/api/end_ponits.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/shared_preferences_cash_helper.dart';
import 'package:post_bet/features/authentication/presentation/views/add_new_password_screen.dart';
import 'package:post_bet/features/authentication/presentation/views/forget_password_screen.dart';
import 'package:post_bet/features/authentication/presentation/views/login_screen.dart';
import 'package:post_bet/features/authentication/presentation/views/regester_screen.dart';
import 'package:post_bet/features/authentication/presentation/views/verfy_new_password_screen.dart';
import 'package:post_bet/features/authentication/presentation/views/verify_mail_screen.dart';
import 'package:post_bet/features/home/presentation/views/creare_post_view.dart';
import 'package:post_bet/features/home/presentation/views/home_screen.dart';
import 'package:post_bet/features/on_boarding/presentations/on_boarding_view.dart';
import 'package:post_bet/features/authentication/presentation/views/welcom_view.dart';
import 'package:post_bet/features/profile/presentation/view/edit%20profile%20screen.dart';
import 'package:post_bet/features/settings/presentation/views/about_us_view.dart';
import 'package:post_bet/features/settings/presentation/views/change_password_view.dart';
import 'package:post_bet/features/settings/presentation/views/cobons_view.dart';
import 'package:post_bet/features/settings/presentation/views/enter_promocode_view.dart';
import 'package:post_bet/features/settings/presentation/views/my_subscription_view.dart';
import 'package:post_bet/features/settings/presentation/views/private_chat_view.dart';
import 'package:post_bet/features/settings/presentation/views/subscription_view.dart';

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
  static const kCobonsView = '/CobonsView';
  static const kAddPostView = '/AddPostView';
  static const kSubscriptionView = '/SubscriptionView';
  static const kPaymentView = '/PaymentView';
  static const kChangePassword = '/changePassword';
  static const kNewChangePassword = '/newChangePassword';
  static const kVerifyNewChangePassword = '/VerifyNewChangePassword';
  static const kPrivateChat = '/PrivateChat';
  static const kAboutUs = '/AboutUs';

  static const kEnterPromo = '/EnterPromo';
  static const kMySubscription = '/MySubscription';

  static final router = GoRouter(
      initialLocation:
          //kHomeLayOut,
          getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.token) !=
                  null
              ? kHomeLayOut
              : getIt
                          .get<CashHelperSharedPreferences>()
                          .getData(key: 'onBoarding') ==
                      true
                  ? kLogin
                  : kOnBoarding,
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
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: kHomeLayOut,
          builder: (context, state) => const HomeLayout(),
        ),
        GoRoute(
          path: kEditProfile,
          builder: (context, state) => const EditProfileScreen(),
        ),
        GoRoute(
          path: kCobonsView,
          builder: (context, state) => const CobonsView(),
        ),
        GoRoute(
          path: kAddPostView,
          builder: (context, state) => const CreatePostView(),
        ),
        GoRoute(
          path: kSubscriptionView,
          builder: (context, state) => const SubscriptionsView(),
        ),
        GoRoute(
          path: kChangePassword,
          builder: (context, state) => const ChangePasswordView(),
        ),
        GoRoute(
          path: kNewChangePassword,
          builder: (context, state) => const AddNewPasswordScreen(),
        ),
        GoRoute(
          path: kVerifyNewChangePassword,
          builder: (context, state) => const VerifyNewPasswordEmailScreen(),
        ),
        GoRoute(
          path: kPrivateChat,
          builder: (context, state) => const PrivateChat(),
        ),
        GoRoute(
          path: kAboutUs,
          builder: (context, state) => const AboutUsview(),
        ),
        GoRoute(
          path: kEnterPromo,
          builder: (context, state) => const EnterPromoView(),
        ),
        GoRoute(
          path: kMySubscription,
          builder: (context, state) => const MySubscriptionView(),
        ),
      ]);
}
