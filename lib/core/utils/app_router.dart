import 'package:go_router/go_router.dart';
import 'package:post_bet/features/registration/presentation/login_view.dart';

abstract class AppRouter {
  static const kLoginView = '/';

  static final router = GoRouter(initialLocation: kLoginView, routes: [
    GoRoute(
      path: kLoginView,
      builder: (context, state) => const LoginScreen(),
    ),
  ]);
}
