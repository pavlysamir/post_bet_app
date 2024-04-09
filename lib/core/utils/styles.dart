import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_bet/constants.dart';

abstract class Styles {
  static const title1textStyle20 = TextStyle(
    fontSize: 20, fontWeight: FontWeight.w600, //color: kPrimaryKey
  );

  static TextStyle textStyle32Black = TextStyle(
      fontSize: 32.sp, fontWeight: FontWeight.bold, color: Colors.black);
  static TextStyle textStyle32Orange = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: kPrimaryKey,
  );

  static TextStyle textStyle12 =
      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold);

  static TextStyle textStyle12Orange = TextStyle(
      fontSize: 12.sp, fontWeight: FontWeight.bold, color: kPrimaryKey);

  static TextStyle textStyle8 = TextStyle(
    fontSize: 8.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textStyle14Grey = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );
  static TextStyle textStyle14Orange = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: kPrimaryKey,
  );

  static TextStyle textStyle14White = TextStyle(
      fontSize: 14.sp, fontWeight: FontWeight.normal, color: Colors.white);

  static TextStyle textStyle14Black = TextStyle(
      fontSize: 14.sp, fontWeight: FontWeight.normal, color: kBlackColor);

  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );
  static TextStyle textStyle18Grey = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.normal,
    color: const Color(0xff2D2D2D).withAlpha(90),
  );
  static const textStyle24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.normal,
    // color: kPrimaryKey,
    decoration: TextDecoration.underline,
  );
  static const textStyle24SemiBold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
  static const button1textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const textStyle16Bold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const button2textStyle12 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
}
