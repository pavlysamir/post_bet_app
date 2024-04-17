import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/utils/widgets/custom_title_text.dart';
import 'package:post_bet/features/settings/presentation/views/payment_view.dart';
import 'package:post_bet/features/settings/presentation/views/widgets/subscription_plan_container.dart';
import 'package:post_bet/generated/l10n.dart';

class SubscriptionsView extends StatelessWidget {
  const SubscriptionsView({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            CustomTitleText(text: S.of(context).subscribePlan),
            SizedBox(height: 40.h),
            SubscriptionPlansCntainer(
              function: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PaymentView(
                    price: "10.00\$",
                    text: S.of(context).basic,
                  );
                }));
              },
              price: "10.00\$",
              countPosts: '.${S.of(context).fivePosts}',
              description: '.${S.of(context).shareWithTickTok}',
              typePlan: S.of(context).basic,
            ),
            SizedBox(height: 25.h),
            SubscriptionPlansCntainer(
              function: () {},
              price: "15.00\$",
              countPosts: '.${S.of(context).tenPosts}',
              description: '.${S.of(context).shareWithTickandSnap}',
              typePlan: S.of(context).standard,
            ),
            SizedBox(height: 25.h),
            SubscriptionPlansCntainer(
              function: () {},
              price: "20.00\$",
              countPosts: '.${S.of(context).unlimitedPosts}',
              description: '.${S.of(context).shareAllPlatform}',
              typePlan: S.of(context).premium,
            ),
            SizedBox(height: 25.h),
          ],
        ),
      ),
    );
  }
}
