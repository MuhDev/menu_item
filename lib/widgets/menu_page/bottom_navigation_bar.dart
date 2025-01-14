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
              isScrollable: true,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 6.w),
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
