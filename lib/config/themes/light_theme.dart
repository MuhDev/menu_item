import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors_repo.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: ColorRepo.primeryColor),
  useMaterial3: false,
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorRepo.backgroundColor,
    elevation: 0,
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
