import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menu_item/config/constants/colors_repo.dart';
import 'package:menu_item/config/constants/padding.dart';
import 'package:menu_item/screens/item_details.dart';
import 'package:menu_item/widgets/menu_page/image_carousel.dart';

import '../helpers/default_page_container.dart';
import '../widgets/menu_page/bottom_navigation_bar.dart';
import '../widgets/menu_page/delivery_location_widget.dart';
import '../widgets/menu_page/menu_app_bar.dart';
import '../widgets/menu_page/menu_item.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarDividerColor: Colors.black),
    );
    return DefaultTabController(
      length: 5,
      child: DefaultPageContainer(
        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(kToolbarHeight),
        //   child: SafeArea(
        //     child: Padding(
        //       padding: EdgeInsets.symmetric(horizontal: PaddingRepo.p16.w),
        //       child: const MenuAppBar(),
        //     ),
        //   ),
        // ),
        bottomNavigationBar: MenuBottomNavigationBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: PaddingRepo.p16.w),
                  child: const MenuAppBar(),
                ),
                SizedBox(
                  height: PaddingRepo.p8.h,
                ),
                SizedBox(
                  child: const MenuImageCarousel(),
                  height: 170.h,
                ),
                SizedBox(
                  height: PaddingRepo.p12.h,
                ),
                Container(
                  height: 44.h,
                  width: 353.w,
                  decoration: BoxDecoration(
                    color: ColorRepo.lightgreyBackgroundColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: const DeliveryLocationWidget(),
                ),
                SizedBox(
                  height: PaddingRepo.p12.h,
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ItemDetailsScreen(),
                            ),
                          );
                        },
                        child: MenuItem());
                  },
                  itemCount: 12,
                  separatorBuilder: (context, index) => SizedBox(
                    height: PaddingRepo.p12.h,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
