import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/constants/colors_repo.dart';

class itemDetials extends StatelessWidget {
  const itemDetials({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Summer Sushi Platter',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 6.h),
        Text(
          'Fresh and colorful, expertly made with the freshest succulent shrimp, creamy avocado, and tangy pickled ginger. A drizzle of our signature sauce adds the perfect finishing touch.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: 6.h),
        Text(
          '436 Calories',
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: ColorRepo.primeryColor),
        ),
      ],
    );
  }
}
