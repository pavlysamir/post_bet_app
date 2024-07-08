import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/Assets/Assets.dart';
import 'package:post_bet/core/utils/app_router.dart';
import 'package:post_bet/core/utils/styles.dart';
import 'package:post_bet/core/utils/widgets/custom_go_navigator.dart';
import 'package:post_bet/features/authentication/presentation/views/widgets/custom_button_login.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomScreen extends StatelessWidget {
  const WelcomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.welcome,
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
                  AppLocalizations.of(context)!.letsSatrt,
                  style: Styles.textStyle14Grey,
                ),
                SizedBox(
                  height: 82.h,
                ),
                CustomAuthButton(
                  color: kPrimaryKey,
                  image: AssetsData.googleIcon,
                  text: 'انشاء حساب',
                  colorTxt: Colors.white,
                  function: () {
                    customGoAndDeleteNavigate(
                        context: context, path: AppRouter.kRegistretion);
                  },
                ),
                SizedBox(
                  height: 18.h,
                ),
                CustomAuthButton(
                  colorTxt: kPrimaryKey,
                  color: Colors.white,
                  image: AssetsData.emailIcon,
                  text: AppLocalizations.of(context)!.welcomTextButton2,
                  function: () {
                    customGoAndDeleteNavigate(
                        context: context, path: AppRouter.kLogin);
                  },
                ),
                SizedBox(
                  height: 26.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
