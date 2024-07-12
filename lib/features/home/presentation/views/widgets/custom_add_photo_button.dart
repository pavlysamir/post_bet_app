import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';
import 'package:dotted_border/dotted_border.dart';

class CustomAddPhotoButton extends StatelessWidget {
  const CustomAddPhotoButton(
      {super.key,
      required this.function,
      required this.text,
      required this.icon});
  final Function() function;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: DottedBorder(
        color: Colors.grey,
        strokeWidth: 2,
        borderType: BorderType.RRect,
        radius: const Radius.circular(10),
        dashPattern: const [6, 3],
        child: Container(
          width: 150.w,
          height: 150.h,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.grey,
                size: 60,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                text,
                style: TextStyle(color: kBlackColor, fontSize: 14.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
