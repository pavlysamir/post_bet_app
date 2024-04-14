import 'package:flutter/material.dart';
import 'package:post_bet/core/colors/colors_light.dart';

class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.primaryColor,
    required this.secondaryColor,
    required this.blackColor,
    required this.poppingsRedColor,
  });

  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? blackColor;
  final Color? poppingsRedColor;

  @override
  ThemeExtension<MyColors> copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? blackColor,
    Color? poppingsRedColor,
  }) {
    return MyColors(
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      blackColor: blackColor,
      poppingsRedColor: poppingsRedColor,
    );
  }

  @override
  ThemeExtension<MyColors> lerp(
    covariant ThemeExtension<MyColors>? other,
    double t,
  ) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      blackColor: blackColor,
      poppingsRedColor: poppingsRedColor,
    );
  }

  static const MyColors dark = MyColors(
    primaryColor: ColorsLight.kPrimaryKey,
    secondaryColor: ColorsLight.kSecondaryKey,
    blackColor: ColorsLight.kBlackColor,
    poppingsRedColor: ColorsLight.kPoppingsRedColor,
  );

  static const MyColors light = MyColors(
    primaryColor: ColorsLight.kPrimaryKey,
    secondaryColor: ColorsLight.kSecondaryKey,
    blackColor: ColorsLight.kBlackColor,
    poppingsRedColor: ColorsLight.kPoppingsRedColor,
  );
}
