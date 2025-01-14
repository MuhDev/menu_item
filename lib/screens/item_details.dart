import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menu_item/config/constants/colors_repo.dart';
import 'package:menu_item/config/constants/padding.dart';
import 'package:shimmer/shimmer.dart';

import '../widgets/item_details/additions_selector.dart';
import '../widgets/item_details/custom_back_button.dart';
import '../widgets/item_details/custome_size_selector.dart';
import '../widgets/item_details/item_details_bottom.dart';
import '../widgets/item_details/item_details_container.dart';
import '../widgets/item_details/item_details_section.dart';

class ItemDetailsScreen extends StatefulWidget {
  @override
  _ItemDetailsScreenState createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  String selectedSize = 'Medium';
  int quantity = 1;
  final double basePrice = 51.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 85.w,
        leading: CustomBackButton(),
        centerTitle: true,
        title: Text(
          'Chicken egg bowl',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl:
                  "https://s3-alpha-sig.figma.com/img/48e3/39a2/2103b18b52a13d9f04b16718135f92d4?Expires=1737936000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=LAv1rbo2br9beF0UPu0LClvEaqlD477fbKAIzsZaOCCPPshzaczOcURhsnLl9Y1TOMQa2ps2S8GpMrdY8lxJPQnADhK7C1j~oWMWLbtxE305fKcGqn9lPYbiSe1ggdOhNp0WK4JtpHgrM~amkdkA9eiSBSyO2XjL88gX4U1bkOLS9Do1u5yL60lodeBSbAQ-uzSwD7FkJaYbZn9jw58x5qqIYc6-GHHalyHy1LqAZasL6aO-1ZO39sHKcKnXJTWrUyR11j55qBerdrnduvMwwBtd0JnIYtsKBdC4tjtksY7~oW24-oppy71fKp3ODlrsdPknXAXXuo1U7TAfq6lfFA__",
              fit: BoxFit.cover,
              width: double.infinity,
              height: 302.h,
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
            SizedBox(
              height: 16.h,
            ),
            ItemDetailsContainer(
              height: 184.h,
              child: itemDetials(),
            ),
            SizedBox(height: 10.h),
            ItemDetailsContainer(
              height: 140.h,
              child: CustomSizeSelector(
                options: getSizeOptions(),
                onSizeSelected: (size) {
                  setState(() {
                    selectedSize = size;
                  });
                },
              ),
            ),
            SizedBox(height: 10.h),
            ItemDetailsContainer(
                child: AdditionsSelector(
              onSelectionsChanged: (p0) {},
            )),
            SizedBox(height: 10.h),
            ItemDetailsContainer(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Notes",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Add a Note',
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      border: InputBorder.none),
                )
              ],
            )),
          ],
        ),
      ),
      bottomNavigationBar: ItemDetailedBottomBar(
        addQuantity: () => setState(() => quantity++),
        removeQuantity: () {
          if (quantity > 1) {
            setState(() => quantity--);
          }
        },
        basePrice: basePrice,
        quantity: quantity,
      ),
    );
  }

  List<SizeOption> getSizeOptions() {
    return [
      SizeOption(
        size: 'Small',
        price: '- SAR 10.00',
        isSelected: selectedSize == 'Small',
      ),
      SizeOption(
        size: 'Medium',
        price: '',
        isSelected: selectedSize == 'Medium',
      ),
      SizeOption(
        size: 'Large',
        price: '+ SAR 15.00',
        isSelected: selectedSize == 'Large',
      ),
    ];
  }
}
