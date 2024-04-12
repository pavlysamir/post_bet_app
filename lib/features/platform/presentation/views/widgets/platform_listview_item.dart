import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/core/Assets/Assets.dart';
import 'package:post_bet/core/utils/styles.dart';

class PlatformListViewItem extends StatelessWidget {
  const PlatformListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 130.w,
          height: 60.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Column(children: [
            Image.asset(AssetsData.googleIcon),
            Text(
              'Platform Name',
              style: Styles.textStyle14Grey,
            ),
          ]),
        ),
      ),
    );
  }
}
