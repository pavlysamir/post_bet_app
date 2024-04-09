import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/utils/styles.dart';

class CustomButtonSmall extends StatelessWidget {
  const CustomButtonSmall(
      {super.key, required this.function, required this.text});
  final Function() function;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: function,
        child: Container(
          height: 40.h,
          width: 78.w,
          decoration: BoxDecoration(
            color: kPrimaryKey,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Text(
              text,
              style: Styles.textStyle14White,
            ),
          ),
        ));
  }
}
