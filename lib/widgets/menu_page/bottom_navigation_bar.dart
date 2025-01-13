import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/constants/assets_repo.dart';
import '../../config/constants/colors_repo.dart';

class MenuBottomNavigationBar extends StatelessWidget {
  const MenuBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: ColorRepo.lightgreyBackgroundColor),
                bottom:
                    const BorderSide(color: ColorRepo.lightgreyBackgroundColor),
              ),
            ),
            child: TabBar(
              indicatorPadding: EdgeInsets.symmetric(horizontal: 6.w),
              indicator: const UnderlineTabIndicator(
                borderSide:
                    BorderSide(width: 2.0, color: ColorRepo.primeryColor),
                insets: EdgeInsets.fromLTRB(
                    0, 0, 0, 40), // Moves the indicator above the label
              ),
              labelStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorRepo.primeryColor),
              indicatorColor: ColorRepo.primeryColor,
              isScrollable: true, // Enables scrolling for the tabs
              tabs: const [
                Tab(text: 'Ramadan deals'),
                Tab(text: 'Main dishes'),
                Tab(text: 'Side dishes'),
                Tab(text: 'For sharing'),
                Tab(text: 'Drinks'),
              ],
            ),
          ),
          BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AssetsRepo.memoIcon),
                label: 'Menu',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AssetsRepo.bagShoppingIcon,
                  color: ColorRepo.greyIconColor,
                ),
                label: 'Bag',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AssetsRepo.cashRegisterIcon,
                  color: ColorRepo.greyIconColor,
                ),
                label: 'Orders',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AssetsRepo.menuIcon,
                  color: ColorRepo.greyIconColor,
                ),
                label: 'More',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
