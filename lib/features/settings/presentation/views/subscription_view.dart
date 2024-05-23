import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/utils/widgets/custom_title_text.dart';
import 'package:post_bet/features/settings/presentation/manager/settings_cubit/cubit/settings_cubit.dart';
import 'package:post_bet/features/settings/presentation/views/tap_payment_screen.dart';
import 'package:post_bet/features/settings/presentation/views/widgets/custom_subscription_listView.dart';
import 'package:post_bet/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class SubscriptionsView extends StatelessWidget {
  const SubscriptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) async {
        if (state is SubscraptionSuccess) {
          await Navigator.push(context, MaterialPageRoute(builder: (context) {
            return WebViewPaynet(
              uri: SettingsCubit.get(context).subscriptionModel!.transactionUrl,
            );
          }));
          // launchUrl(
          //     Uri.parse(
          //       SettingsCubit.get(context).subscriptionModel!.transactionUrl,
          //     ),
          //     mode: LaunchMode.externalApplication);
          await SettingsCubit.get(context).mySubscription();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('successfuly subscraption'),
          ));
        } else if (state is MySubscraptionSuccess) {
          await SettingsCubit.get(context).confirmSubscription().then((value) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('successfuly subscraption'),
            ));
            SettingsCubit.get(context).getPlans();
          });
        } else if (state is SubscraptionFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
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
          body: state is GetPlansSuccess
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40.h),
                      CustomTitleText(text: S.of(context).subscribePlan),
                      SizedBox(height: 40.h),
                      // SubscriptionPlansCntainer(
                      //   function: () {
                      //     Navigator.push(context,
                      //         MaterialPageRoute(builder: (context) {
                      //       return PaymentView(
                      //         price: "10.00\$",
                      //         text: S.of(context).basic,
                      //       );
                      //     }));
                      //   },
                      //   price: "10.00\$",
                      //   countPosts: '.${S.of(context).fivePosts}',
                      //   description: '.${S.of(context).shareWithTickTok}',
                      //   typePlan: S.of(context).basic,
                      // // ),
                      // SizedBox(height: 25.h),
                      // SubscriptionPlansCntainer(
                      //   function: () {
                      //     SettingsCubit.get(context).getPlans();
                      //   },
                      //   price: "15.00\$",
                      //   countPosts: '.${S.of(context).tenPosts}',
                      //   description: '.${S.of(context).shareWithTickandSnap}',
                      //   typePlan: S.of(context).standard,
                      // ),
                      // SizedBox(height: 25.h),
                      // SubscriptionPlansCntainer(
                      //   function: () {},
                      //   price: "20.00\$",
                      //   countPosts: '.${S.of(context).unlimitedPosts}',
                      //   description: '.${S.of(context).shareAllPlatform}',
                      //   typePlan: S.of(context).premium,
                      // ),
                      // SizedBox(height: 25.h),

                      CustomListViewSubscriptionPlan(
                        count: SettingsCubit.get(context).plans.length,
                        planModel: SettingsCubit.get(context).plans,
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
