import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/Assets/Assets.dart';
import 'package:post_bet/core/utils/app_router.dart';
import 'package:post_bet/core/utils/styles.dart';
import 'package:post_bet/core/utils/widgets/custom_go_navigator.dart';
import 'package:post_bet/features/authentication/presentation/views/widgets/custom_button_login.dart';
import 'package:post_bet/generated/l10n.dart';

class WelcomScreen extends StatelessWidget {
  const WelcomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 76.h,
            ),
            Image.asset(AssetsData.loginLogo),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).welcome,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'POSTBET',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: kPrimaryKey),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              S.of(context).letsSatrt,
              style: Styles.textStyle14Grey,
            ),
            SizedBox(
              height: 25.h,
            ),
            const CustomAuthButton(
              image: AssetsData.googleIcon,
              text: 'Continue with Google',
            ),
            SizedBox(
              height: 18.h,
            ),
            const CustomAuthButton(
              image: AssetsData.emailIcon,
              text: 'Continue with Email',
            ),
            SizedBox(
              height: 26.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).haveAccount,
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    customGoAndDeleteNavigate(
                        context: context, path: AppRouter.kLogin);
                  },
                  child: Text(S.of(context).login,
                      style: Styles.textStyle14Orange),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
