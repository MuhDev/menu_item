import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menu_item/config/constants/padding.dart';
import 'package:menu_item/helpers/dumy_data.dart';

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
                  child: Image.network(
                    item,
                    fit: BoxFit.cover,
                  ),
                ),
              ))
          .toList(),
    );
  }
}
