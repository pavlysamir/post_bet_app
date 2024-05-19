import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/Assets/Assets.dart';
import 'package:post_bet/core/utils/app_router.dart';
import 'package:post_bet/core/utils/widgets/custom_go_navigator.dart';
import 'package:post_bet/core/utils/widgets/pop_up_dialog.dart';
import 'package:post_bet/features/settings/data/models/plane_model.dart';
import 'package:post_bet/features/settings/presentation/manager/settings_cubit/cubit/settings_cubit.dart';
import 'package:post_bet/features/settings/presentation/views/tap_payment_screen.dart';
import 'package:post_bet/features/settings/presentation/views/widgets/subscription_plan_container.dart';
import 'package:post_bet/generated/l10n.dart';

class CustomListViewSubscriptionPlan extends StatelessWidget {
  const CustomListViewSubscriptionPlan({
    super.key,
    required this.count,
    required this.planModel,
  });
  final int count;
  final List<PlanModel> planModel;

  @override
  Widget build(BuildContext context) {
    bool isFree = false;
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is SubscraptionSuccess && isFree == false) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return WebViewPaynet(
              uri: SettingsCubit.get(context).subscriptionModel!.transactionUrl,
            );
          }));
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('successfuly subscraption'),
          ));
        } else if (state is SubscraptionFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(height: 25.h);
            },
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: count,
            itemBuilder: (context, index) {
              return SubscriptionPlansCntainer(
                function: () async {
                  if (planModel[index].price == 0) {
                    //call confirm subscription
                    SettingsCubit.get(context).confirmSubscription();
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => PopUpDialog(
                        context: context,
                        function: () {
                          customJustGoNavigate(
                              context: context, path: AppRouter.kEnterPromo);
                        },
                        title: S.of(context).doPromocode,
                        subTitle: '',
                        colorButton1: kPoppingsRedColor,
                        colorButton2: Colors.red,
                        textColortcolor1: Colors.red,
                        textColortcolor2: Colors.white,
                        function2: () async {
                          await SettingsCubit.get(context)
                              .subscription(
                                  planId: '${planModel[index].id}',
                                  promoCode: '')
                              .then((value) {
                            isFree = false;
                          });
                        },
                      ),
                    );
                  }
                },
                price: "${planModel[index].price}\$",
                countPosts:
                    'number of posts : ${planModel[index].numberOfPosts}',
                //description: '.${S.of(context).shareAllPlatform}',
                typePlan: planModel[index].name,
                platForms:
                    'FaceBook : ${planModel[index].facebook} , Twitter : ${planModel[index].twitter} , Instagram : ${planModel[index].instagram} , TikTok : ${planModel[index].tiktok} , pinterest : ${planModel[index].pinterest} , linkedin : ${planModel[index].linkedin} , reddit : ${planModel[index].reddit} ',
                widgets: [
                  planModel[index].facebook
                      ? Image.asset(
                          AssetsData.faceBookIcon,
                          height: 20.h,
                        )
                      : Container(),
                  SizedBox(width: 10.w),
                  planModel[index].twitter
                      ? Image.asset(
                          AssetsData.xIcon,
                          height: 20.h,
                        )
                      : Container(),
                  SizedBox(width: 10.w),
                  planModel[index].instagram
                      ? Image.asset(
                          AssetsData.instagramIcon,
                          height: 20.h,
                        )
                      : Container(),
                  SizedBox(width: 10.w),
                  planModel[index].linkedin
                      ? Image.asset(
                          AssetsData.linkedln,
                          height: 20.h,
                        )
                      : Container(),
                  SizedBox(width: 10.w),
                  planModel[index].pinterest
                      ? Image.asset(
                          AssetsData.pinterest,
                          height: 20.h,
                        )
                      : Container(),
                  SizedBox(width: 10.w),
                  planModel[index].reddit
                      ? Image.asset(
                          AssetsData.reddit,
                          height: 20.h,
                        )
                      : Container(),
                  SizedBox(width: 10.w),
                  planModel[index].tiktok
                      ? Image.asset(
                          AssetsData.tiktok,
                          height: 20.h,
                        )
                      : Container(),
                  SizedBox(width: 10.w),
                ],
              );
            });
      },
    );
  }
}
