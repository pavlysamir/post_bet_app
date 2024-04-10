import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';
import '../utils/styles.dart';

ThemeData themeData = ThemeData(
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
