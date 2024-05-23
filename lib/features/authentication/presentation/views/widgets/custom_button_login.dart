import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_bet/constants.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    super.key,
    required this.image,
    required this.text,
  });
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40.h,
        width: 222.w,
        decoration: BoxDecoration(
          border: Border.all(color: kBlackColor),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                child: Image.asset(
              image,
            )),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 12,
              ),
            )
          ],
        ));
  }
}
