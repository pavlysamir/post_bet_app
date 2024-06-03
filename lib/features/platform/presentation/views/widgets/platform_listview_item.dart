import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/utils/styles.dart';

class PlatformListViewItem extends StatelessWidget {
  const PlatformListViewItem(
      {super.key,
      required this.image,
      required this.text,
      required this.function});
  final String image;
  final String text;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: GestureDetector(
        onTap: function,
        child: Container(
          width: 130.w,
          height: 50.h,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: kPrimaryKey),
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
                Image.asset(image, height: 40.h, width: 40.w),
                SizedBox(height: 10.h),
                Text(
                  text,
                  style: Styles.textStyle14Grey,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ]),
        ),
      ),
    );
  }
}
