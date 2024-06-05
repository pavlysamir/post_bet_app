import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/Assets/Assets.dart';
import 'package:post_bet/core/utils/widgets/pop_up_dialog.dart';
import 'package:post_bet/features/settings/data/models/plane_model.dart';
import 'package:post_bet/features/settings/presentation/manager/settings_cubit/cubit/settings_cubit.dart';
import 'package:post_bet/features/settings/presentation/views/enter_promocode_view.dart';
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
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) async {},
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
                  if (planModel[index].isFree == true) {
                    //call confirm subscription
                    await SettingsCubit.get(context).mySubscription();
                  } else if (planModel[index].isFree == false) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => PopUpDialog(
                        context: context,
                        function: () async {
                          //await SettingsCubit.get(context).mySubscription();

                          Navigator.pop(context);

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return EnterPromoView(
                                planeId: '${planModel[index].id}');
                          }));
                        },
                        title: S.of(context).doPromocode,
                        subTitle: '',
                        colorButton1: Colors.white,
                        colorButton2: kPrimaryKey,
                        textColortcolor1: kPrimaryKey,
                        textColortcolor2: Colors.white,
                        function2: () async {
                          Navigator.pop(context);

                          await SettingsCubit.get(context).subscription(
                              planId: '${planModel[index].id}', promoCode: '');
                        },
                      ),
                    );
                  }
                },
                price: "${planModel[index].price} AED",
                countPosts:
                    'number of posts : ${planModel[index].numberOfPosts ?? '∞'}',
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
                  planModel[index].telegram
                      ? Image.asset(
                          AssetsData.telegram,
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
