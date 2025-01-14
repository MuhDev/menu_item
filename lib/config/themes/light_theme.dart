import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors_repo.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: ColorRepo.primeryColor),
  useMaterial3: false,
  fontFamily: "Vazirmatn",
  tabBarTheme: TabBarTheme(
    indicator: const UnderlineTabIndicator(
      borderSide: BorderSide(width: 2.0, color: ColorRepo.primeryColor),
      insets: EdgeInsets.fromLTRB(
          0, 0, 0, 40), // Moves the indicator above the label
    ),
    labelStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: ColorRepo.primeryColor),
    indicatorColor: ColorRepo.primeryColor,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: ColorRepo.backgroundColor,
    elevation: 0,
    titleTextStyle: TextStyle(
        fontSize: 16.sp,
        color: ColorRepo.blackFontColor,
        fontWeight: FontWeight.w500),
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
        color: ColorRepo.blackFontColor,
        fontSize: 32.sp,
        fontWeight: FontWeight.w500),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: ColorRepo.backgroundColor,
    elevation: 0,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: ColorRepo.primeryColor,
    unselectedItemColor: Colors.black.withOpacity(0.5),
  ),
  iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
    iconColor: WidgetStatePropertyAll(ColorRepo.blackIconColor),
  )),
  iconTheme: const IconThemeData(color: ColorRepo.blackIconColor),
);
