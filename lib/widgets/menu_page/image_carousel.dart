import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menu_item/config/constants/padding.dart';
import 'package:menu_item/helpers/dumy_data.dart';
import 'package:shimmer/shimmer.dart';

class MenuImageCarousel extends StatefulWidget {
  const MenuImageCarousel({super.key});

  @override
  State<MenuImageCarousel> createState() => _MenuImageCarouselState();
}

class _MenuImageCarouselState extends State<MenuImageCarousel> {
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: _controller,
      options: CarouselOptions(
        height: 168.h,
        autoPlay: true,
        enableInfiniteScroll: false,
        viewportFraction: 0.90,
      ),
      items: imageCarouselData
          .map((item) => Container(
                margin:
                    EdgeInsetsDirectional.symmetric(horizontal: PaddingRepo.p8),
                width: 390.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                  child: CachedNetworkImage(
                    imageUrl: item,
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
              ))
          .toList(),
    );
  }
}
