import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/core/utils/styles.dart';

class SubscriptionPlansCntainer extends StatelessWidget {
  const SubscriptionPlansCntainer({
    super.key,
    required this.price,
    required this.countPosts,
    required this.description,
    required this.typePlan,
    required this.function,
  });
  final String price;
  final String countPosts;
  final String description;
  final String typePlan;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: GestureDetector(
        onTap: function,
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
              Text(
                typePlan,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(height: 2.h),
              Text(
                price,
                style: Styles.textStyle48Orange,
              ),
              SizedBox(height: 15.h),
              Text(
                countPosts,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 5.h),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
