import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/Assets/Assets.dart';
import 'package:post_bet/core/utils/widgets/custom_title_text.dart';
import 'package:post_bet/features/settings/presentation/manager/settings_cubit/cubit/settings_cubit.dart';
import 'package:post_bet/features/settings/presentation/views/widgets/custom_my_subscraption_item.dart';
import 'package:post_bet/generated/l10n.dart';

class MySubscriptionView extends StatelessWidget {
  const MySubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) async {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios, color: kPrimaryKey),
            ),
            title: CustomTitleText(text: S.of(context).subscribe),
          ),
          body: state is MyPlanLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: kPrimaryKey,
                ))
              : SettingsCubit.get(context).mySubscriptionModel == null
                  ? Center(child: Text(S.of(context).noSubscriptions))
                  : state is ConfirmSubscraptionSuccess
                      ? SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 40.h),
                              CustomTitleText(
                                  text: S.of(context).subscribePlan),
                              SizedBox(height: 40.h),
                              // CustomListViewMySubscriptionPlan(
                              //   count: SettingsCubit.get(context)
                              //       .mySubscriptionList
                              //       .length,
                              //   myListSubscrabtiopn: SettingsCubit.get(context)
                              //       .mySubscriptionList,
                              // ),
                              MySubscriptionPlansCntainer(
                                endSubscriptionDate:
                                    'End Date : ${SettingsCubit.get(context).mySubscriptionModel!.endSubscriptionDate}',
                                countPosts:
                                    'number of posts : ${SettingsCubit.get(context).mySubscriptionModel!.plan.numberOfPosts}',
                                platForms:
                                    'FaceBook : ${SettingsCubit.get(context).mySubscriptionModel!.plan.facebook} ,Twitter : ${SettingsCubit.get(context).mySubscriptionModel!.plan.twitter} ,Instagram : ${SettingsCubit.get(context).mySubscriptionModel!.plan.instagram} ,TikTok : ${SettingsCubit.get(context).mySubscriptionModel!.plan.tiktok} ,pinterest : ${SettingsCubit.get(context).mySubscriptionModel!.plan.pinterest} , linkedin : ${SettingsCubit.get(context).mySubscriptionModel!.plan.linkedIn} ,  reddit : ${SettingsCubit.get(context).mySubscriptionModel!.plan.reddit} ',
                                widgets: [
                                  SettingsCubit.get(context)
                                          .mySubscriptionModel!
                                          .plan
                                          .facebook
                                      ? Image.asset(
                                          AssetsData.faceBookIcon,
                                          height: 20.h,
                                        )
                                      : Container(),
                                  SizedBox(width: 10.w),
                                  SettingsCubit.get(context)
                                          .mySubscriptionModel!
                                          .plan
                                          .twitter
                                      ? Image.asset(
                                          AssetsData.xIcon,
                                          height: 20.h,
                                        )
                                      : Container(),
                                  SizedBox(width: 10.w),
                                  SettingsCubit.get(context)
                                          .mySubscriptionModel!
                                          .plan
                                          .instagram
                                      ? Image.asset(
                                          AssetsData.instagramIcon,
                                          height: 20.h,
                                        )
                                      : Container(),
                                  SizedBox(width: 10.w),
                                  SettingsCubit.get(context)
                                          .mySubscriptionModel!
                                          .plan
                                          .linkedIn
                                      ? Image.asset(
                                          AssetsData.linkedln,
                                          height: 20.h,
                                        )
                                      : Container(),
                                  SizedBox(width: 10.w),
                                  SettingsCubit.get(context)
                                          .mySubscriptionModel!
                                          .plan
                                          .pinterest
                                      ? Image.asset(
                                          AssetsData.pinterest,
                                          height: 20.h,
                                        )
                                      : Container(),
                                  SizedBox(width: 10.w),
                                  SettingsCubit.get(context)
                                          .mySubscriptionModel!
                                          .plan
                                          .reddit
                                      ? Image.asset(
                                          AssetsData.reddit,
                                          height: 20.h,
                                        )
                                      : Container(),
                                  SizedBox(width: 10.w),
                                  SettingsCubit.get(context)
                                          .mySubscriptionModel!
                                          .plan
                                          .tiktok
                                      ? Image.asset(
                                          AssetsData.tiktok,
                                          height: 20.h,
                                        )
                                      : Container(),
                                  SizedBox(width: 10.w),
                                  SettingsCubit.get(context)
                                          .mySubscriptionModel!
                                          .plan
                                          .telegram
                                      ? Image.asset(
                                          AssetsData.telegram,
                                          height: 20.h,
                                        )
                                      : Container(),
                                  SizedBox(width: 10.w),
                                  SettingsCubit.get(context)
                                          .mySubscriptionModel!
                                          .plan
                                          .youTube
                                      ? Image.asset(
                                          AssetsData.youtube,
                                          height: 20.h,
                                        )
                                      : Container(),
                                  SizedBox(width: 10.w),
                                  SettingsCubit.get(context)
                                          .mySubscriptionModel!
                                          .plan
                                          .googleBusiness
                                      ? Image.asset(
                                          AssetsData.googleBusiness,
                                          height: 20.h,
                                        )
                                      : Container(),
                                  SizedBox(width: 10.w),
                                ],
                                typePlan: SettingsCubit.get(context)
                                    .mySubscriptionModel!
                                    .plan
                                    .name,
                              ),
                              SizedBox(
                                height: 25.h,
                              )
                            ],
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(
                          color: kPrimaryKey,
                        )),
        );
      },
    );
  }
}
