import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/constants/colors_repo.dart';

class ItemDetailedBottomBar extends StatelessWidget {
  const ItemDetailedBottomBar({
    required this.removeQuantity,
    required this.addQuantity,
    required this.basePrice,
    required this.quantity,
    super.key,
  });
  final void Function()? removeQuantity;
  final void Function()? addQuantity;
  final double basePrice;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
          ),
        ],
      ),
      child: SizedBox(
        height: 50.h,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: ColorRepo.greyBackgroundColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  IconButton(
                      icon: const Icon(
                        Icons.remove,
                        color: ColorRepo.greyIconColor,
                      ),
                      onPressed: removeQuantity),
                  Text('$quantity'),
                  IconButton(
                      icon: const Icon(
                        Icons.add,
                        color: ColorRepo.primeryColor,
                      ),
                      onPressed: addQuantity),
                ],
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorRepo.primeryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r))),
                onPressed: () {},
                child: Text(
                  'Add to bag    SAR ${(basePrice * quantity).toStringAsFixed(2)}',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
