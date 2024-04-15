import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:post_bet/core/utils/styles.dart';

class CustomButtonSmall extends StatelessWidget {
  const CustomButtonSmall(
      {super.key,
      required this.function,
      required this.text,
      this.color = kPrimaryKey,
      this.textColortcolor = Colors.white,
      this.width = 78,
      required this.borderColor});
  final Function() function;
  final String text;
  final Color color;
  final Color textColortcolor;
  final double width;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: function,
        child: Container(
          height: 40.h,
          width: width.w,
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            color: color,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Text(
              text,
              style: Styles.textStyle14White.copyWith(color: textColortcolor),
            ),
          ),
        ));
  }
}
