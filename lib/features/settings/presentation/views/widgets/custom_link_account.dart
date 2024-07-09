import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/Assets/Assets.dart';

class CustomLinkAccount extends StatelessWidget {
  const CustomLinkAccount(
      {this.icon, required this.title, this.function, super.key});
  final Icon? icon;
  final String title;
  final Function()? function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 18),
      child: Column(
        children: [
          Row(
            children: [
              icon ??
                  const CircleAvatar(radius: 15, backgroundColor: Colors.black),
              SizedBox(width: 13.w),
              Text(title, style: Theme.of(context).textTheme.titleLarge),
              const Spacer(),
              IconButton(
                  onPressed: function,
                  icon: const Text(
                    'link',
                    style: TextStyle(color: kPrimaryKey, fontSize: 16),
                  ))
            ],
          ),
          Row(
            children: [
              Image.asset(
                AssetsData.faceBookIcon,
                height: 20.h,
              ),
              SizedBox(width: 10.w),
              Image.asset(
                AssetsData.xIcon,
                height: 20.h,
              ),
              SizedBox(width: 10.w),
              Image.asset(
                AssetsData.instagramIcon,
                height: 20.h,
              ),
              SizedBox(width: 10.w),
              Image.asset(
                AssetsData.linkedln,
                height: 20.h,
              ),
              SizedBox(width: 10.w),
              Image.asset(
                AssetsData.pinterest,
                height: 20.h,
              ),
              SizedBox(width: 10.w),
              Image.asset(
                AssetsData.reddit,
                height: 20.h,
              ),
              SizedBox(width: 10.w),
              Image.asset(
                AssetsData.tiktok,
                height: 20.h,
              ),
              SizedBox(width: 10.w),
              Image.asset(
                AssetsData.telegram,
                height: 20.h,
              ),
              SizedBox(width: 10.w),
            ],
          )
        ],
      ),
    );
  }
}
