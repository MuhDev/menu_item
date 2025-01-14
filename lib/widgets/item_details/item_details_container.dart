import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menu_item/config/constants/colors_repo.dart';

import '../../config/constants/padding.dart';

class ItemDetailsContainer extends StatelessWidget {
  const ItemDetailsContainer({required this.child, this.height, super.key});
  final Widget child;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: ColorRepo.dividergreyBackgroundColor))),
      padding: EdgeInsets.symmetric(horizontal: PaddingRepo.p16.w),
      child: child,
    );
  }
}
