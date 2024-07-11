import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/utils/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:post_bet/core/utils/widgets/custom_button_small.dart';

class SubscriptionPlansCntainer extends StatelessWidget {
  const SubscriptionPlansCntainer({
    super.key,
    required this.price,
    required this.countPosts,
    // required this.description,
    required this.typePlan,
    required this.function,
    required this.platForms,
    required this.widgets,
  });
  final String price;
  final String countPosts;
  // final String description;
  final String typePlan;
  final String platForms;
  final List<Widget> widgets;

  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Container(
        // height: 200.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              //offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: 17.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 42.h,
                    width: 116.w,
                    decoration: BoxDecoration(
                        color: kPrimaryKey,
                        borderRadius: BorderRadius.circular(17)),
                    child: Center(
                      child: Text(
                        typePlan,
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    price,
                    style:
                        Styles.textStyle32Orange.copyWith(color: kBlackColor),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Row(
                children: [
                  const Icon(Icons.check_circle_outline, color: kPrimaryKey),
                  SizedBox(width: 10.w),
                  Text(
                    countPosts,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
            // SizedBox(height: 5.h),
            // Text(
            //   description,
            //   style: Theme.of(context).textTheme.bodyMedium,
            // ),
            SizedBox(height: 20.h),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: widgets,
                  ),
                  SizedBox(
                    width: 140.w,
                    height: 60.h,
                    child: CustomButtonSmall(
                      borderColor: kPrimaryKey,
                      text: AppLocalizations.of(context)!.subscribe,
                      color: kPrimaryKey,
                      function: function,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
