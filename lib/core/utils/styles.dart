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

  static TextStyle textStyle8 = TextStyle(
    fontSize: 8.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textStyle14 = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );

  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
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
