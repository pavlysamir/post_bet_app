import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/api/end_ponits.dart';
import 'package:post_bet/core/utils/app_router.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/shared_preferences_cash_helper.dart';
import 'package:post_bet/core/utils/widgets/custom_go_navigator.dart';
import 'package:post_bet/core/utils/widgets/custom_line_seperator.dart';
import 'package:post_bet/core/utils/widgets/custom_title_text.dart';
import 'package:post_bet/core/utils/widgets/pop_up_dialog.dart';
import 'package:post_bet/features/settings/presentation/manager/settings_cubit/cubit/settings_cubit.dart';
import 'package:post_bet/features/settings/presentation/views/terms_conditions_view.dart';
import 'package:post_bet/features/settings/presentation/views/widgets/setting_icon_widget.dart';
import '../../../../../generated/l10n.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is LogOutSuccess) {
          customGoAndDeleteNavigate(context: context, path: AppRouter.kLogin);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              S.of(context).settings,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const CustomLineSeperator(),
              SizedBox(height: 40.h),
              CustomTitleText(text: S.of(context).accounts),
              SizedBox(height: 26.h),
              InkWell(
                onTap: () {
                  customJustGoNavigate(
                      context: context, path: AppRouter.kEditProfile);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      getIt
                                  .get<CashHelperSharedPreferences>()
                                  .getData(key: ApiKey.profilePic) !=
                              null
                          ? CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 20,
                              child: ClipOval(
                                child: File(getIt
                                            .get<CashHelperSharedPreferences>()
                                            .getData(key: ApiKey.profilePic))
                                        .existsSync() // Check if the file exists
                                    ? Image.file(
                                        fit: BoxFit.fill,
                                        width: double.infinity,
                                        File(getIt
                                            .get<CashHelperSharedPreferences>()
                                            .getData(key: ApiKey.profilePic)),
                                      )
                                    : const Icon(Icons.person),
                              ),
                            )
                          : const CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 20,
                              child: Icon(Icons.person),
                            ),
                      SizedBox(width: 10.w),
                      Text(
                          '${getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.name)}',
                          style: Theme.of(context).textTheme.titleLarge),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: kPrimaryKey,
                        size: 24,
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
                icon: const Icon(Icons.password, color: Colors.white),
                title: S.of(context).changePassword,
                function: () {
                  customJustGoNavigate(
                      context: context, path: AppRouter.kChangePassword);
                },
              ),
              SettingsIconWidget(
                function: () {
                  SettingsCubit.get(context).getPlans();
                  customJustGoNavigate(
                      context: context, path: AppRouter.kSubscriptionView);
                },
                title: S.of(context).subscribe,
              ),
              SettingsIconWidget(
                function: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => PopUpDialog(
                      context: context,
                      function: () {
                        SettingsCubit.get(context).changeLanguage();
                        Navigator.pop(context);
                      },
                      title: 'Confirm Change langeuage',
                      subTitle: S.of(context).doChangeLanguage,
                      colorButton1: kPoppingsRedColor,
                      colorButton2: Colors.red,
                      textColortcolor1: Colors.red,
                      textColortcolor2: Colors.white,
                    ),
                  );
                },
                title: S.of(context).changeLanguage,
              ),
              SettingsIconWidget(
                function: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TermsAndConditionsScreen();
                  }));
                },
                icon: const Icon(Icons.text_snippet, color: Colors.white),
                title: S.of(context).termsAndConditions,
              ),
              SettingsIconWidget(
                icon: const Icon(Icons.delete, color: Colors.white),
                title: S.of(context).deleteAccount,
                function: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => PopUpDialog(
                            context: context,
                            function: () {
                              SettingsCubit.get(context).deleteAccount();

                              Navigator.pop(context);
                            },
                            title: 'Confirm Log Out',
                            subTitle: S.of(context).doChangeTheme,
                            colorButton1: kPoppingsRedColor,
                            colorButton2: Colors.red,
                            textColortcolor1: Colors.red,
                          ));
                },
              ),
              SettingsIconWidget(
                function: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => PopUpDialog(
                      context: context,
                      function: () {
                        SettingsCubit.get(context).changeTheme();
                        Navigator.pop(context);
                      },
                      title: 'Confirm Change Theme',
                      subTitle: S.of(context).doChangeTheme,
                      colorButton1: kPoppingsRedColor,
                      colorButton2: Colors.red,
                      textColortcolor1: Colors.red,
                      textColortcolor2: Colors.white,
                    ),
                  );
                },
                title: S.of(context).changeTheme,
              ),
              SettingsIconWidget(
                function: () {
                  SettingsCubit.get(context).getPromoCode();
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
                function: () {},
                title: S.of(context).aboutUs,
              ),
              SettingsIconWidget(
                icon: const Icon(
                  Icons.help_outline_sharp,
                  color: Colors.white,
                ),
                title: S.of(context).helpCenter,
                function: () {
                  SettingsCubit.get(context).getContactUsMessage();
                  customJustGoNavigate(
                      context: context, path: AppRouter.kPrivateChat);
                },
              ),
              SettingsIconWidget(
                function: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => PopUpDialog(
                      context: context,
                      function: () {
                        SettingsCubit.get(context).logout();

                        Navigator.pop(context);
                      },
                      title: 'Confirm Log Out',
                      subTitle: S.of(context).doChangeTheme,
                      colorButton1: kPoppingsRedColor,
                      colorButton2: Colors.red,
                      textColortcolor1: Colors.red,
                      textColortcolor2: Colors.white,
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                title: S.of(context).logOut,
              ),
            ]),
          ),
        );
      },
    );
  }
}
