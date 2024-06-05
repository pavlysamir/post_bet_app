import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySubscriptionPlansCntainer extends StatelessWidget {
  const MySubscriptionPlansCntainer({
    super.key,
    required this.countPosts,
    // required this.description,
    required this.typePlan,
    required this.platForms,
    required this.widgets,
  });
  final String countPosts;
  // final String description;
  final String typePlan;
  final String platForms;
  final List<Widget> widgets;

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
            Text(
              typePlan,
              style: Theme.of(context).textTheme.labelLarge,
            ),

            SizedBox(height: 15.h),
            Text(
              countPosts,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            // SizedBox(height: 5.h),
            // Text(
            //   description,
            //   style: Theme.of(context).textTheme.bodyMedium,
            // ),
            SizedBox(height: 20.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widgets,
            ),
            SizedBox(height: 20.h),

            // CustomButtonSmall(
            //     width: 150.w,
            //     function: () {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         const SnackBar(
            //           content: Text('Done'),
            //         ),
            //       );
            //     },
            //     text: 'confirm plan',
            //     borderColor: kPrimaryKey),
          ],
        ),
      ),
    );
  }
}
