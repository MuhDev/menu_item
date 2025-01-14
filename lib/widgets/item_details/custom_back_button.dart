import 'package:flutter/material.dart';

import '../../config/constants/colors_repo.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Row(
        children: [
          SizedBox(width: 8),
          Icon(Icons.arrow_back_ios, size: 20, color: ColorRepo.primeryColor),
          Text(
            "Menu",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(height: 2, color: ColorRepo.primeryColor),
          ),
        ],
      ),
    );
  }
}
