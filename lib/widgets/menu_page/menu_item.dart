import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../config/constants/colors_repo.dart';
import 'animated_quantity_control.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 103.h,
      width: 390.w,
      padding: EdgeInsets.only(
        left: 18.w,
        right: 18.w,
      ),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(color: ColorRepo.lightgreyBackgroundColor))),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.only(bottom: 10.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: CachedNetworkImage(
                  imageUrl:
                      "https://s3-alpha-sig.figma.com/img/48e3/39a2/2103b18b52a13d9f04b16718135f92d4?Expires=1737936000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=LAv1rbo2br9beF0UPu0LClvEaqlD477fbKAIzsZaOCCPPshzaczOcURhsnLl9Y1TOMQa2ps2S8GpMrdY8lxJPQnADhK7C1j~oWMWLbtxE305fKcGqn9lPYbiSe1ggdOhNp0WK4JtpHgrM~amkdkA9eiSBSyO2XjL88gX4U1bkOLS9Do1u5yL60lodeBSbAQ-uzSwD7FkJaYbZn9jw58x5qqIYc6-GHHalyHy1LqAZasL6aO-1ZO39sHKcKnXJTWrUyR11j55qBerdrnduvMwwBtd0JnIYtsKBdC4tjtksY7~oW24-oppy71fKp3ODlrsdPknXAXXuo1U7TAfq6lfFA__",
                  fit: BoxFit.cover,
                  placeholder: (context, url) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Summer Sushi Platter",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorRepo.blackFontColor),
                ),
                Text(
                  "Fresh and colorful, expertly made with the freshest succulent shrimp, creamy avocado, and tangy pickled ginger. A drizzle of our signature sauce adds the perfect finishing touch to this refreshing and satisfying meal.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      height: 1.2,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: ColorRepo.blackFontColor),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "SAR 41.00",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorRepo.primeryColor),
                    ),
                    AnimatedQuantityController(
                      onQuantityChanged: (p0) {},
                      height: 30.h,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
