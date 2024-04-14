import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_bet/core/Theme/color_extension.dart';
import 'package:post_bet/core/colors/colors_dark.dart';
import 'package:post_bet/core/colors/colors_light.dart';

import '../../constants.dart';
import '../utils/styles.dart';

ThemeData themeLightData = ThemeData(
  scaffoldBackgroundColor: ColorsLight.kwhiteKey,
  extensions: const <ThemeExtension<dynamic>>[
    MyColors.light,
  ],
  textTheme: GoogleFonts.poppinsTextTheme(),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    unselectedItemColor: Colors.grey,
    selectedItemColor: kPrimaryKey,
    elevation: 0.0,
    type: BottomNavigationBarType.fixed,
  ),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.black,
    ),
    iconTheme: const IconThemeData(color: kPrimaryKey),
    backgroundColor: Colors.white,
    toolbarHeight: 70,
    elevation: 0,
    titleTextStyle: Styles.textStyle12,
  ),
  tabBarTheme: TabBarTheme(
      labelColor: kPrimaryKey,
      indicatorColor: kPrimaryKey,
      dividerColor: kPrimaryKey,
      overlayColor: MaterialStateProperty.all(kPrimaryKey),
      unselectedLabelColor: kPrimaryKey,
      mouseCursor: MaterialStateMouseCursor.clickable),
);

ThemeData themeDarkData = ThemeData(
  scaffoldBackgroundColor: ColorsLight.kBlackColor,
  extensions: const <ThemeExtension<dynamic>>[
    MyColors.light,
  ],
  textTheme: const TextTheme(
    displaySmall: TextStyle(
      fontSize: 14,
      color: ColorsDark.kwhiteKey,
      //fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    unselectedItemColor: Colors.grey,
    selectedItemColor: kPrimaryKey,
    elevation: 0.0,
    type: BottomNavigationBarType.fixed,
  ),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.black,
    ),
    iconTheme: const IconThemeData(color: kPrimaryKey),
    backgroundColor: Colors.white,
    toolbarHeight: 70,
    elevation: 0,
    titleTextStyle: Styles.textStyle12,
  ),
  tabBarTheme: TabBarTheme(
      labelColor: kPrimaryKey,
      indicatorColor: kPrimaryKey,
      dividerColor: kPrimaryKey,
      overlayColor: MaterialStateProperty.all(kPrimaryKey),
      unselectedLabelColor: kPrimaryKey,
      mouseCursor: MaterialStateMouseCursor.clickable),
);
