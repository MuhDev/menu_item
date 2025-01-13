import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/constants/assets_repo.dart';
import '../../config/constants/colors_repo.dart';

class DeliveryLocationWidget extends StatelessWidget {
  const DeliveryLocationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: SvgPicture.asset(AssetsRepo.mopedIcon),
        ),
        Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Delivery',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: ColorRepo.primeryColor,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  'RHYA3696, 3696 Al Imam Saud Ibn Abdul Aziz Brand Road,',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: ColorRepo.blackFontColor,
                      fontWeight: FontWeight.w400),
                ),
              ],
            )),
        Expanded(
          flex: 2,
          child: Icon(
            Icons.arrow_forward_ios,
            size: 13.sp,
          ),
        ),
      ],
    );
  }
}
