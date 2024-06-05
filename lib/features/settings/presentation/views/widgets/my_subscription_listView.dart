import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/core/Assets/Assets.dart';
import 'package:post_bet/features/settings/data/models/my_subscription_model.dart';
import 'package:post_bet/features/settings/presentation/manager/settings_cubit/cubit/settings_cubit.dart';
import 'package:post_bet/features/settings/presentation/views/widgets/custom_my_subscraption_item.dart';

class CustomListViewMySubscriptionPlan extends StatelessWidget {
  const CustomListViewMySubscriptionPlan({
    super.key,
    required this.count,
    required this.myListSubscrabtiopn,
  });
  final int count;
  final List<MySubscriptionModel> myListSubscrabtiopn;

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
              return MySubscriptionPlansCntainer(
                countPosts:
                    'number of posts : ${myListSubscrabtiopn[index].plan.numberOfPosts ?? '∞'}',

                //  myListSubscrabtiopn[index].plan.numberOfPosts ==
                //         null
                //     ? 'number of posts : ${myListSubscrabtiopn[index].plan.numberOfPosts ?? '∞'}'
                //     : 'number of posts : ∞',
                platForms:
                    'FaceBook : ${myListSubscrabtiopn[index].plan.facebook} ,Twitter : ${myListSubscrabtiopn[index].plan.twitter} ,Instagram : ${myListSubscrabtiopn[index].plan.instagram} ,TikTok : ${myListSubscrabtiopn[index].plan.tiktok} ,pinterest : ${myListSubscrabtiopn[index].plan.pinterest} , linkedin : ${myListSubscrabtiopn[index].plan.linkedIn} ,  reddit : ${myListSubscrabtiopn[index].plan.reddit} ',
                widgets: [
                  myListSubscrabtiopn[index].plan.facebook
                      ? Image.asset(
                          AssetsData.faceBookIcon,
                          height: 20.h,
                        )
                      : Container(),
                  SizedBox(width: 10.w),
                  myListSubscrabtiopn[index].plan.twitter
                      ? Image.asset(
                          AssetsData.xIcon,
                          height: 20.h,
                        )
                      : Container(),
                  SizedBox(width: 10.w),
                  myListSubscrabtiopn[index].plan.instagram
                      ? Image.asset(
                          AssetsData.instagramIcon,
                          height: 20.h,
                        )
                      : Container(),
                  SizedBox(width: 10.w),
                  myListSubscrabtiopn[index].plan.linkedIn
                      ? Image.asset(
                          AssetsData.linkedln,
                          height: 20.h,
                        )
                      : Container(),
                  SizedBox(width: 10.w),
                  myListSubscrabtiopn[index].plan.pinterest
                      ? Image.asset(
                          AssetsData.pinterest,
                          height: 20.h,
                        )
                      : Container(),
                  SizedBox(width: 10.w),
                  myListSubscrabtiopn[index].plan.reddit
                      ? Image.asset(
                          AssetsData.reddit,
                          height: 20.h,
                        )
                      : Container(),
                  SizedBox(width: 10.w),
                  myListSubscrabtiopn[index].plan.tiktok
                      ? Image.asset(
                          AssetsData.tiktok,
                          height: 20.h,
                        )
                      : Container(),
                  SizedBox(width: 10.w),
                ],
                typePlan: myListSubscrabtiopn[index].plan.name,
              );
              // SubscriptionPlansCntainer(
              //   function: () async {
              //     if (planModel[index].isFree == true) {
              //       //call confirm subscription
              //       await SettingsCubit.get(context).mySubscription();
              //     } else if (planModel[index].isFree == false) {
              //       showDialog(
              //         context: context,
              //         builder: (BuildContext context) => PopUpDialog(
              //           context: context,
              //           function: () async {
              //             await SettingsCubit.get(context).mySubscription();

              //             customJustGoNavigate(
              //                 context: context, path: AppRouter.kEnterPromo);
              //             Navigator.pop(context);
              //           },
              //           title: S.of(context).doPromocode,
              //           subTitle: '',
              //           colorButton1: kPoppingsRedColor,
              //           colorButton2: Colors.red,
              //           textColortcolor1: Colors.red,
              //           textColortcolor2: Colors.white,
              //           function2: () async {
              //             Navigator.pop(context);

              //             await SettingsCubit.get(context).subscription(
              //                 planId: '${planModel[index].id}', promoCode: '');
              //           },
              //         ),
              //       );
              //     }
              //   },
              //   price: "${planModel[index].price}\$",
              //   countPosts:
              //       'number of posts : ${planModel[index].numberOfPosts}',
              //   //description: '.${S.of(context).shareAllPlatform}',
              //   typePlan: planModel[index].name,
              //   platForms:
              //       'FaceBook : ${planModel[index].facebook} , Twitter : ${planModel[index].twitter} , Instagram : ${planModel[index].instagram} , TikTok : ${planModel[index].tiktok} , pinterest : ${planModel[index].pinterest} , linkedin : ${planModel[index].linkedin} , reddit : ${planModel[index].reddit} ',
              //   widgets: [
              //     planModel[index].facebook
              //         ? Image.asset(
              //             AssetsData.faceBookIcon,
              //             height: 20.h,
              //           )
              //         : Container(),
              //     SizedBox(width: 10.w),
              //     planModel[index].twitter
              //         ? Image.asset(
              //             AssetsData.xIcon,
              //             height: 20.h,
              //           )
              //         : Container(),
              //     SizedBox(width: 10.w),
              //     planModel[index].instagram
              //         ? Image.asset(
              //             AssetsData.instagramIcon,
              //             height: 20.h,
              //           )
              //         : Container(),
              //     SizedBox(width: 10.w),
              //     planModel[index].linkedin
              //         ? Image.asset(
              //             AssetsData.linkedln,
              //             height: 20.h,
              //           )
              //         : Container(),
              //     SizedBox(width: 10.w),
              //     planModel[index].pinterest
              //         ? Image.asset(
              //             AssetsData.pinterest,
              //             height: 20.h,
              //           )
              //         : Container(),
              //     SizedBox(width: 10.w),
              //     planModel[index].reddit
              //         ? Image.asset(
              //             AssetsData.reddit,
              //             height: 20.h,
              //           )
              //         : Container(),
              //     SizedBox(width: 10.w),
              //     planModel[index].tiktok
              //         ? Image.asset(
              //             AssetsData.tiktok,
              //             height: 20.h,
              //           )
              //         : Container(),
              //     SizedBox(width: 10.w),
              //   ],
              // );
            });
      },
    );
  }
}
