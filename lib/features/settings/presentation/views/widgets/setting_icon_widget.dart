import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/utils/styles.dart';

class SettingsIconWidget extends StatelessWidget {
  const SettingsIconWidget({this.icon, required this.title, super.key});
  final Icon? icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 18),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: kPrimaryKey,
              child: icon ??
                  const CircleAvatar(radius: 15, backgroundColor: Colors.white),
            ),
            SizedBox(width: 13.w),
            Text(title, style: Styles.textStyle14W500Black),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: kPrimaryKey,
                size: 24,
              ),
            ),
          ],
        ));
  }
}
