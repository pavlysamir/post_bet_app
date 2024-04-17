import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/utils/app_router.dart';
import 'package:post_bet/core/utils/widgets/custom_go_navigator.dart';
import 'package:post_bet/core/utils/widgets/custom_line_seperator.dart';
import 'package:post_bet/core/utils/widgets/custom_title_text.dart';
import 'package:post_bet/features/settings/presentation/views/widgets/setting_icon_widget.dart';
import '../../../../../generated/l10n.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).settings,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CustomLineSeperator(),
          SizedBox(height: 40.h),
          CustomTitleText(text: S.of(context).accounts),
          SizedBox(height: 26.h),
          GestureDetector(
            onTap: () {
              customJustGoNavigate(
                  context: context, path: AppRouter.kEditProfile);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: kBlackColor,
                  ),
                  SizedBox(width: 10.w),
                  Text('john smith',
                      style: Theme.of(context).textTheme.titleLarge),
                  SizedBox(width: 180.w),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: kPrimaryKey,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
          const CustomLineSeperator(),
          SizedBox(height: 30.h),
          CustomTitleText(text: S.of(context).settings),
          SettingsIconWidget(
            icon: const Icon(
              Icons.help_outline_sharp,
              color: Colors.white,
            ),
            title: S.of(context).helpCenter,
          ),
          SettingsIconWidget(
            function: () {
              customJustGoNavigate(
                  context: context, path: AppRouter.kCobonsView);
            },
            icon: const Icon(
              Icons.local_offer,
              color: Colors.white,
            ),
            title: S.of(context).Cobons,
          ),
          SettingsIconWidget(
            title: S.of(context).aboutUs,
          ),
          SettingsIconWidget(
            function: () {
              customJustGoNavigate(
                  context: context, path: AppRouter.kSubscriptionView);
            },
            title: S.of(context).subscribe,
          ),
          SettingsIconWidget(
            title: S.of(context).changeLanguage,
          ),
          SettingsIconWidget(
            icon: const Icon(Icons.text_snippet, color: Colors.white),
            title: S.of(context).termsAndConditions,
          ),
          SettingsIconWidget(
            icon: const Icon(Icons.delete, color: Colors.white),
            title: S.of(context).deleteAccount,
          ),
          SettingsIconWidget(
            title: S.of(context).changeTheme,
          ),
          SettingsIconWidget(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            title: S.of(context).logOut,
          ),
        ]),
      ),
    );
  }
}
