import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/api/end_ponits.dart';
import 'package:post_bet/core/utils/app_router.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/shared_preferences_cash_helper.dart';
import 'package:post_bet/core/utils/widgets/custom_go_navigator.dart';
import 'package:post_bet/core/utils/widgets/pop_up_dialog.dart';
import 'package:post_bet/features/authentication/presentation/manager/login_cubit/login_cubit.dart';
import 'package:post_bet/features/settings/presentation/manager/settings_cubit/cubit/settings_cubit.dart';
import 'package:post_bet/features/settings/presentation/views/terms_conditions_view.dart';
import 'package:post_bet/features/settings/presentation/views/widgets/custom_link_account.dart';
import 'package:post_bet/features/settings/presentation/views/widgets/setting_icon_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  dynamic profilePic =
      getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.profilePic);
  @override
  Widget build(BuildContext context) {
    Uint8List? profileImage;
    try {
      profileImage = base64Decode(profilePic.toString());
    } catch (e) {
      print('Error decoding profile picture: $e');
      // Handle decoding error
    }

    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is LogOutSuccess) {
          customGoAndDeleteNavigate(context: context, path: AppRouter.kLogin);
        } else if (state is DeleteAccountSuccess) {
          customGoAndDeleteNavigate(context: context, path: AppRouter.kLogin);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.settings,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50.h),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryKey),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 80.h),
                          Text(
                              '${getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.name)}',
                              style: Theme.of(context).textTheme.titleLarge),
                          SizedBox(height: 3.h),
                          Text(
                              '${getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.email)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: Colors.grey[600])),
                          SizedBox(height: 20.h),
                          SettingsIconWidget(
                            icon: const Icon(Icons.person_2_outlined,
                                color: kBlackColor),
                            title: AppLocalizations.of(context)!.editProfile,
                            function: () {
                              LoginCubit.get(context)!.getUserProfile();
                              customJustGoNavigate(
                                  context: context,
                                  path: AppRouter.kEditProfile);
                            },
                          ),
                          SettingsIconWidget(
                            icon:
                                const Icon(Icons.password, color: kBlackColor),
                            title: AppLocalizations.of(context)!.changePassword,
                            function: () {
                              customJustGoNavigate(
                                  context: context,
                                  path: AppRouter.kChangePassword);
                            },
                          ),
                          SettingsIconWidget(
                            function: () {
                              SettingsCubit.get(context).getPlans();
                              customJustGoNavigate(
                                  context: context,
                                  path: AppRouter.kSubscriptionView);
                            },
                            title: AppLocalizations.of(context)!.subscribe,
                            icon: const Icon(Icons.credit_card,
                                color: kBlackColor),
                          ),
                          CustomLinkAccount(
                            icon: const Icon(Icons.link, color: kBlackColor),
                            title: AppLocalizations.of(context)!.linkAcount,
                            function: () async {
                              SettingsCubit.get(context)
                                  .linkAcount()
                                  .then((value) {
                                launchUrl(Uri.parse(value),
                                    mode: LaunchMode.externalApplication);

                                // Navigator.push(context,
                                //     MaterialPageRoute(builder: (context) {
                                //   return WebViewPaynet(
                                //     uri: value,
                                //   );
                                // }));
                              });
                            },
                          ),
                          SettingsIconWidget(
                            function: () {
                              SettingsCubit.get(context).myPlan().then((value) {
                                SettingsCubit.get(context)
                                    .confirmSubscription();
                              });
                              customJustGoNavigate(
                                  context: context,
                                  path: AppRouter.kMySubscription);
                            },
                            icon: const Icon(Icons.list, color: kBlackColor),
                            title: AppLocalizations.of(context)!.mySbscription,
                          ),
                          SettingsIconWidget(
                            function: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => PopUpDialog(
                                  function2: () {
                                    Navigator.pop(context);
                                  },
                                  context: context,
                                  function: () {
                                    SettingsCubit.get(context).changeLanguage();
                                    Navigator.pop(context);
                                  },
                                  title: AppLocalizations.of(context)!
                                      .confirmChangeLng,
                                  subTitle: AppLocalizations.of(context)!
                                      .doChangeLanguage,
                                  colorButton1: Colors.white,
                                  colorButton2: kPrimaryKey,
                                  textColortcolor1: kPrimaryKey,
                                  textColortcolor2: Colors.white,
                                ),
                              );
                            },
                            icon:
                                const Icon(Icons.language, color: kBlackColor),
                            title: AppLocalizations.of(context)!.changeLanguage,
                          ),
                          SettingsIconWidget(
                            function: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return TermsAndConditionsScreen();
                              }));
                            },
                            icon: const Icon(
                              Icons.text_snippet_outlined,
                              color: kBlackColor,
                            ),
                            title: AppLocalizations.of(context)!
                                .termsAndConditions,
                          ),
                          SettingsIconWidget(
                            icon: const Icon(Icons.delete_outlined,
                                color: kBlackColor),
                            title: AppLocalizations.of(context)!.deleteAccount,
                            function: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      PopUpDialog(
                                        function2: () {
                                          Navigator.pop(context);
                                        },
                                        context: context,
                                        function: () async {
                                          SettingsCubit.get(context)
                                              .deleteAccount();

                                          Navigator.pop(context);
                                        },
                                        title: AppLocalizations.of(context)!
                                            .deletAccountConfirm,
                                        subTitle: '',
                                        colorButton1: Colors.white,
                                        colorButton2: kPrimaryKey,
                                        textColortcolor1: kPrimaryKey,
                                      ));
                            },
                          ),
                          SettingsIconWidget(
                            function: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => PopUpDialog(
                                  function2: () {
                                    Navigator.pop(context);
                                  },
                                  context: context,
                                  function: () {
                                    SettingsCubit.get(context).changeTheme();
                                    Navigator.pop(context);
                                  },
                                  title: AppLocalizations.of(context)!
                                      .changeThemeConfirm,
                                  subTitle: AppLocalizations.of(context)!
                                      .doChangeTheme,
                                  colorButton1: Colors.white,
                                  colorButton2: kPrimaryKey,
                                  textColortcolor1: kPrimaryKey,
                                  textColortcolor2: Colors.white,
                                ),
                              );
                            },
                            icon: const Icon(Icons.color_lens_outlined,
                                color: kBlackColor),
                            title: AppLocalizations.of(context)!.changeTheme,
                          ),
                          SettingsIconWidget(
                            function: () {
                              SettingsCubit.get(context).getPromoCode();
                              customJustGoNavigate(
                                  context: context,
                                  path: AppRouter.kCobonsView);
                            },
                            icon: const Icon(
                              Icons.card_giftcard,
                              color: kBlackColor,
                            ),
                            title: AppLocalizations.of(context)!.cobons,
                          ),
                          SettingsIconWidget(
                            function: () {
                              customJustGoNavigate(
                                  context: context, path: AppRouter.kAboutUs);
                            },
                            title: AppLocalizations.of(context)!.aboutUs,
                            icon: const Icon(
                              Icons.info_outline,
                              color: kBlackColor,
                            ),
                          ),
                          SettingsIconWidget(
                            icon: const Icon(
                              Icons.post_add,
                              color: kBlackColor,
                            ),
                            function: () {
                              customJustGoNavigate(
                                  context: context,
                                  path: AppRouter.kWhatCanPost);
                            },
                            title: AppLocalizations.of(context)!.whatUCanPost,
                          ),
                          SettingsIconWidget(
                            icon: const Icon(
                              Icons.help_outline_sharp,
                              color: kBlackColor,
                            ),
                            title: AppLocalizations.of(context)!.helpCenter,
                            function: () {
                              SettingsCubit.get(context).getContactUsMessage();
                              customJustGoNavigate(
                                  context: context,
                                  path: AppRouter.kPrivateChat);
                            },
                          ),
                          SettingsIconWidget(
                            function: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => PopUpDialog(
                                  function2: () {
                                    Navigator.pop(context);
                                  },
                                  context: context,
                                  function: () {
                                    SettingsCubit.get(context).logout();

                                    Navigator.pop(context);
                                  },
                                  title: AppLocalizations.of(context)!
                                      .logOutConfirm,
                                  subTitle:
                                      AppLocalizations.of(context)!.doLogOut,
                                  colorButton1: Colors.white,
                                  colorButton2: kPrimaryKey,
                                  textColortcolor1: kPrimaryKey,
                                  textColortcolor2: Colors.white,
                                ),
                              );
                            },
                            icon: const Icon(Icons.arrow_back_ios,
                                color: kBlackColor),
                            title: AppLocalizations.of(context)!.logOut,
                          ),
                        ]),
                  ),
                ),
                profilePic != null && profileImage != null
                    ? CircleAvatar(
                        backgroundColor: kPrimaryKey,
                        radius: 52.r,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 50.r,
                          child: ClipOval(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: MemoryImage(
                                    profileImage,
                                  ),
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 50.r,
                        child: const Icon(
                          Icons.person,
                          color: kBlackColor,
                        ),
                      ),
              ],
            ),
          )),
        );
      },
    );
  }
}
