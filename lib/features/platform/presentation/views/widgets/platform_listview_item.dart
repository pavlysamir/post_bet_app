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
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor,
                //spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AssetsData.instagramIcon),
                SizedBox(height: 10.h),
                Text(
                  'Instgram',
                  style: Styles.textStyle14Grey,
                ),
              ]),
        ),
      ),
    );
  }
}
